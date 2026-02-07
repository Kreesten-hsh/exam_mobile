import axios from "axios";
import { AuthService } from "../services/AuthService"; 
// We need a helper or just reuse logic. For simplicity, let's login first or pass token.
// Actually, standalone script is better.

const API_URL = "http://localhost:3000/api";

async function testEvents() {
  console.log("--- Testing Events ---");
  try {
     // Setup: Create Admin User (or use normal user if allowed)
     const email = `admin${Date.now()}@test.com`;
     const registerRes = await axios.post(`${API_URL}/auth/register`, {
       email, password: "password", first_name: "Admin", last_name: "User", gender: "M", birth_date: "1990-01-01"
     });
     const token = registerRes.data.token;

     // 1. Create Event
     console.log("Creating Event...");
     const eventDate = new Date();
     eventDate.setDate(eventDate.getDate() + 7);
     
     const createRes = await axios.post(`${API_URL}/events`, {
       name: "Speed Dating Paris",
       description: "Event de test",
       event_date: eventDate,
       max_men: 10,
       max_women: 10,
       price_full: 20.0,
       price_deposit: 10.0
     }, { headers: { Authorization: `Bearer ${token}` } });
     console.log("Create Event Status:", createRes.status);
     const eventId = createRes.data.id;

     // 2. List Events
     console.log("Listing Events...");
     const listRes = await axios.get(`${API_URL}/events`);
     console.log("List Events Count:", listRes.data.length);

     // 3. Register Participant
     console.log("Registering as Participant...");
     const regPartRes = await axios.post(`${API_URL}/events/${eventId}/register`, {}, {
       headers: { Authorization: `Bearer ${token}` }
     });
     console.log("Participant Register Status:", regPartRes.status);

     return { token, eventId };
  } catch (error: any) {
    console.error("Event Test Failed:", error.response?.data || error.message);
    process.exit(1);
  }
}

testEvents();
