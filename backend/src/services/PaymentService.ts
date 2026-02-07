import { AppDataSource } from "../config/data-source";
import { Payment, PaymentType, PaymentStatus } from "../entities/Payment";
import { Participant, ParticipantStatus } from "../entities/Participant";

export class PaymentService {
  private paymentRepository = AppDataSource.getRepository(Payment);
  private participantRepository = AppDataSource.getRepository(Participant);

  async simulatePayment(participantId: string, type: PaymentType) {
    const participant = await this.participantRepository.findOne({
      where: { id: participantId },
      relations: ["event", "user"]
    });

    if (!participant) throw new Error("Participant not found");

    // Determine expected amount based on type
    let expectedAmount = 0;
    if (type === PaymentType.DEPOSIT) {
      expectedAmount = participant.event.price_deposit;
    } else if (type === PaymentType.FULL_PAYMENT) {
      expectedAmount = participant.event.price_full;
    }

    // Determine new status
    let newStatus = ParticipantStatus.REGISTERED;
    if (type === PaymentType.DEPOSIT) {
      newStatus = ParticipantStatus.PAID_DEPOSIT;
    } else if (type === PaymentType.FULL_PAYMENT) {
      newStatus = ParticipantStatus.PAID_FULL;
    }

    // Logic: If already paid full, cannot pay again
    if (participant.status === ParticipantStatus.PAID_FULL) {
      throw new Error("Already paid in full");
    }

    // Create Payment Record (Simulated)
    const payment = this.paymentRepository.create({
      participant,
      amount: expectedAmount,
      type,
      status: PaymentStatus.SIMULATED_SUCCESS,
      simulated_reference: `SIM-${Math.floor(Math.random() * 1000000)}`
    });

    await this.paymentRepository.save(payment);

    // Update Participant Status
    participant.status = newStatus;
    await this.participantRepository.save(participant);

    return { payment, participant };
  }
}
