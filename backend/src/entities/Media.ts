import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, ManyToOne, JoinColumn } from "typeorm";
import { Event } from "./Event";

export enum MediaType {
  PHOTO = "PHOTO",
  VIDEO = "VIDEO"
}

@Entity("media")
export class Media {
  @PrimaryGeneratedColumn("uuid")
  id: string;

  @ManyToOne(() => Event, (event) => event.media)
  @JoinColumn({ name: "event_id" })
  event: Event;

  @Column("text")
  url: string;

  @Column({ type: "enum", enum: MediaType })
  type: MediaType;

  @CreateDateColumn()
  created_at: Date;
}
