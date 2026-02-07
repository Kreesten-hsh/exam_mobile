import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, OneToMany } from "typeorm";
import { Participant } from "./Participant";
import { Message } from "./Message";

export enum UserRole {
  USER = "USER",
  ADMIN = "ADMIN"
}

export enum Gender {
  M = "M",
  F = "F"
}

@Entity("users")
export class User {
  @PrimaryGeneratedColumn("uuid")
  id: string;

  @Column({ unique: true })
  email: string;

  @Column()
  password_hash: string;

  @Column()
  first_name: string;

  @Column()
  last_name: string;

  @Column({ type: "enum", enum: Gender })
  gender: Gender;

  @Column({ type: "date" })
  birth_date: Date;

  @Column({ type: "text", nullable: true })
  profile_photo_url: string;

  @Column({ type: "enum", enum: UserRole, default: UserRole.USER })
  role: UserRole;

  @CreateDateColumn()
  created_at: Date;

  @OneToMany(() => Participant, (participant) => participant.user)
  participations: Participant[];

  @OneToMany(() => Message, (message) => message.sender)
  sentMessages: Message[];

  @OneToMany(() => Message, (message) => message.receiver)
  receivedMessages: Message[];
}
