import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, ManyToOne, JoinColumn } from "typeorm";
import { Participant } from "./Participant";

export enum PaymentType {
  DEPOSIT = "DEPOSIT",
  FULL_PAYMENT = "FULL_PAYMENT"
}

export enum PaymentStatus {
  SIMULATED_SUCCESS = "SIMULATED_SUCCESS"
  // FAILED and PENDING removed as per requirements
}

@Entity("payments")
export class Payment {
  @PrimaryGeneratedColumn("uuid")
  id: string;

  @ManyToOne(() => Participant, (participant) => participant.payments)
  @JoinColumn({ name: "participant_id" })
  participant: Participant;

  @Column("decimal", { precision: 10, scale: 2 })
  amount: number;

  @Column({ type: "enum", enum: PaymentType })
  type: PaymentType;

  @Column({ type: "enum", enum: PaymentStatus, default: PaymentStatus.SIMULATED_SUCCESS })
  status: PaymentStatus;

  @Column({ nullable: true })
  simulated_reference: string;

  @CreateDateColumn()
  created_at: Date;
}
