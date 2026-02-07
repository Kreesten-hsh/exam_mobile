import { AppDataSource } from "../config/data-source";
import { User, UserRole, Gender } from "../entities/User";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

export class AuthService {
  private userRepository = AppDataSource.getRepository(User);

  async register(data: CreateUserDto) {
    const existingUser = await this.userRepository.findOneBy({ email: data.email });
    if (existingUser) {
      throw new Error("Email already registered");
    }

    const hashedPassword = await bcrypt.hash(data.password, 10);
    const user = this.userRepository.create({
      ...data,
      password_hash: hashedPassword,
      role: UserRole.USER // Force USER unless admin creation logic exists
    });

    await this.userRepository.save(user);
    return this.generateToken(user);
  }

  async login(email: string, password: string) {
    const user = await this.userRepository.findOneBy({ email });
    if (!user) {
      throw new Error("Invalid credentials");
    }

    const isMatch = await bcrypt.compare(password, user.password_hash);
    if (!isMatch) {
      throw new Error("Invalid credentials");
    }

    return this.generateToken(user);
  }

  private generateToken(user: User) {
    const payload = { id: user.id, email: user.email, role: user.role };
    const secret = process.env.JWT_SECRET || "default_secret";
    const token = jwt.sign(payload, secret, { expiresIn: "7d" });
    return { user, token };
  }
}

interface CreateUserDto {
  email: string;
  password: string;
  first_name: string;
  last_name: string;
  gender: Gender;
  birth_date: Date;
  profile_photo_url?: string;
}
