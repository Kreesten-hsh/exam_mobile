import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, ManyToOne, JoinColumn } from "typeorm";
import { User } from "./User";
import { Event } from "./Event";

@Entity("messages")
export class Message {
  @PrimaryGeneratedColumn("uuid")
  id: string;

  @ManyToOne(() => User, (user) => user.sentMessages)
  @JoinColumn({ name: "sender_id" })
  sender: User;

  @ManyToOne(() => User, (user) => user.receivedMessages)
  @JoinColumn({ name: "receiver_id" })
  receiver: User;

  @ManyToOne(() => Event, (event) => event.messages)
  @JoinColumn({ name: "event_id" })
  event: Event;

  @Column({ type: "text", nullable: true })
  content_text: string;

  @Column({ type: "text", nullable: true })
  content_audio_url: string;

  @Column({ default: false })
  is_blocked: boolean;

  @Column({ type: "timestamp", nullable: true })
  read_at: Date;

  @CreateDateColumn()
  created_at: Date;
}
