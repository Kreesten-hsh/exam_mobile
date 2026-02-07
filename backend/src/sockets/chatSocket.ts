import { Server, Socket } from "socket.io";
import { MessageService } from "../services/MessageService";
import jwt from "jsonwebtoken";

const messageService = new MessageService();

export const setupSocketIO = (io: Server) => {
  io.use((socket, next) => {
    const token = socket.handshake.auth.token;
    if (!token) return next(new Error("Authentication error"));

    try {
      const secret = process.env.JWT_SECRET || "default_secret";
      const decoded = jwt.verify(token, secret);
      (socket as any).user = decoded;
      next();
    } catch (err) {
      next(new Error("Authentication error"));
    }
  });

  io.on("connection", (socket: Socket) => {
    const user = (socket as any).user;
    console.log(`User connected: ${user.id}`);

    socket.join(`user_${user.id}`);

    socket.on("join_event", (eventId: string) => {
      socket.join(`event_${eventId}`);
      console.log(`User ${user.id} joined event ${eventId}`);
    });

    socket.on("send_message", async (data: { receiverId: string, eventId: string, content: string, audioUrl?: string }) => {
      try {
        const savedMessage = await messageService.saveMessage(user.id, data.receiverId, data.eventId, data.content, data.audioUrl);

        if (savedMessage && savedMessage.is_blocked) {
            // Shadow ban: Notify sender success (fake), do not send to receiver
            socket.emit("message_sent", { ...savedMessage, status: "shadow_blocked" });
            // Optionally log or alert admin
            console.log(`BLOCKED message from ${user.id} to ${data.receiverId}: ${data.content}`);
        } else {
            // Success
            // Emit to receiver's room
            io.to(`user_${data.receiverId}`).emit("new_message", savedMessage);
            // Emit confirmation to sender
            socket.emit("message_sent", savedMessage);
        }

      } catch (error: any) {
        socket.emit("error", { message: error.message });
      }
    });

    socket.on("disconnect", () => {
      console.log("User disconnected");
    });
  });
};
