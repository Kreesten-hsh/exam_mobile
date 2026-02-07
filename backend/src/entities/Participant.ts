import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, ManyToOne, JoinColumn, OneToMany, Unique } from "typeorm";
import { User } from "./User";
import { Event } from "./Event";
import { Payment } from "./Payment";

export enum ParticipantStatus {
  REGISTERED = "REGISTERED",
  PAID_DEPOSIT = "PAID_DEPOSIT",
  PAID_FULL = "PAID_FULL",
  CANCELLED = "CANCELLED"
}

@Entity("participants")
@Unique(["user", "event"])
export class Participant {
  @PrimaryGeneratedColumn("uuid")
  id: string;

  @ManyToOne(() => User, (user) => user.participations)
  @JoinColumn({ name: "user_id" })
  user: User;

  @ManyToOne(() => Event, (event) => event.participants)
  @JoinColumn({ name: "event_id" })
  event: Event;

  @Column({ type: "enum", enum: ParticipantStatus, default: ParticipantStatus.REGISTERED })
  status: ParticipantStatus;

  @CreateDateColumn()
  created_at: Date;

  @OneToMany(() => Payment, (payment) => payment.participant)
  payments: Payment[];
}
