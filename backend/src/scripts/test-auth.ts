import axios from "axios";

const API_URL = "http://localhost:3000/api/auth";

async function testAuth() {
  console.log("--- Testing Auth ---");
  try {
    // 1. Register
    const email = `test${Date.now()}@example.com`;
    console.log(`Registering user with email: ${email}`);
    const registerRes = await axios.post(`${API_URL}/register`, {
      email,
      password: "password123",
      first_name: "John",
      last_name: "Doe",
      gender: "M",
      birth_date: "1990-01-01",
      profile_photo_url: "http://example.com/photo.jpg"
    });
    console.log("Register Status:", registerRes.status);
    const token = registerRes.data.token;

    if (!token) throw new Error("No token returned!");

    // 2. Login
    console.log("Logging in...");
    const loginRes = await axios.post(`${API_URL}/login`, {
      email,
      password: "password123"
    });
    console.log("Login Status:", loginRes.status);
    
    // 3. Me
    console.log("Checking /me endpoint...");
    const meRes = await axios.get(`${API_URL}/me`, {
      headers: { Authorization: `Bearer ${token}` }
    });
    console.log("Me Status:", meRes.status, "| Role:", meRes.data.role);

    return { token, userId: registerRes.data.user.id };
  } catch (error: any) {
    console.error("Auth Test Failed:", error.response?.data || error.message);
    process.exit(1);
  }
}

testAuth();
