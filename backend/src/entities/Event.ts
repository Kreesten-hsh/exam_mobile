import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, OneToMany } from "typeorm";
import { Participant } from "./Participant";
import { Message } from "./Message";
import { Media } from "./Media";

@Entity("events")
export class Event {
  @PrimaryGeneratedColumn("uuid")
  id: string;

  @Column()
  name: string;

  @Column({ type: "text", nullable: true })
  description: string;

  @Column({ type: "datetime" })
  event_date: Date;

  @Column({ nullable: true })
  location_name: string;

  @Column({ type: "text", nullable: true })
  location_address: string;

  @Column("int")
  max_men: number;

  @Column("int")
  max_women: number;

  @Column("decimal", { precision: 10, scale: 2 })
  price_full: number;

  @Column("decimal", { precision: 10, scale: 2 })
  price_deposit: number;

  @CreateDateColumn()
  created_at: Date;

  @OneToMany(() => Participant, (participant) => participant.event)
  participants: Participant[];

  @OneToMany(() => Message, (message) => message.event)
  messages: Message[];

  @OneToMany(() => Media, (media) => media.event)
  media: Media[];
}
