import io from "socket.io-client";
import axios from "axios";

const API_URL = "http://localhost:3000/api";
const SOCKET_URL = "http://localhost:3000";

async function testChat() {
  console.log("--- Testing Chat ---");
  try {
    // 1. Setup Context (User 1 & User 2)
    const email1 = `chat1${Date.now()}@test.com`;
    const email2 = `chat2${Date.now()}@test.com`;
    
    // ... (helper functions for registerUser/createEvent assumed same)
    const user1 = await registerUser(email1, "User1");
    const user2 = await registerUser(email2, "User2");

    const event = await createEvent(user1.token);

    // 2. Connect Sockets
    const socket1 = io(SOCKET_URL, { auth: { token: user1.token } });
    const socket2 = io(SOCKET_URL, { auth: { token: user2.token } });

    await new Promise<void>((resolve) => {
      let connected = 0;
      const check = () => { connected++; if (connected === 2) resolve(); };
      socket1.on("connect", () => { console.log("User 1 Connected"); check(); });
      socket2.on("connect", () => { console.log("User 2 Connected"); check(); });
    });

    // 3. User 1 sends valid message to User 2
    console.log("User 1 sending 'Hello World'...");
    socket1.emit("send_message", { receiverId: user2.id, eventId: event.id, content: "Hello World" });

    // Expect User 2 to receive
    const msg1Promise = new Promise((resolve) => {
        socket2.on("new_message", (msg: any) => {
            console.log("User 2 Received:", msg.content_text);
            if (msg.content_text === "Hello World") resolve(true);
        });
    });

    // 4. User 2 sends BLOCKED message (Phone number)
    console.log("User 2 sending 'Appelle le 06 12 34 56 78'...");
    socket2.emit("send_message", { receiverId: user1.id, eventId: event.id, content: "Appelle le 06 12 34 56 78" });

    // Expect User 2 to receive "shadow_blocked" confirmation
    const msg2Promise = new Promise((resolve) => {
        socket2.on("message_sent", (msg: any) => {
            if (msg.status === "shadow_blocked" || msg.is_blocked) {
                console.log("User 2 Shadow Blocked Confirmed:", msg.content_text);
                resolve(true);
            }
        });
    });

    // Expect User 1 NOT to receive anything (timeout check ideal, but simplistic here)
    socket1.on("new_message", (msg: any) => {
        if (msg.content_text.includes("06")) {
            console.error("FAIL: User 1 received blocked message!");
            process.exit(1);
        }
    });

    await Promise.all([msg1Promise, msg2Promise]);
    console.log("Chat Test: SUCCESS");
    
    socket1.close();
    socket2.close();
    process.exit(0);

  } catch (error: any) {
    console.error("Chat Test Failed:", error.message);
    process.exit(1);
  }
}

async function registerUser(email: string, firstName: string) {
    const res = await axios.post(`${API_URL}/auth/register`, {
        email, password: "password", first_name: firstName, last_name: "Test", gender: "M", birth_date: "1990-01-01"
    });
    return { token: res.data.token, id: res.data.user.id };
}

async function createEvent(token: string) {
    const res = await axios.post(`${API_URL}/events`, {
        name: "Chat Event", event_date: new Date(), max_men: 10, max_women: 10, price_full: 10, price_deposit: 5
    }, { headers: { Authorization: `Bearer ${token}` } });
    return res.data;
}

testChat();
