import { Request, Response } from "express";
import { AuthService } from "../services/AuthService";

const authService = new AuthService();

export class AuthController {
  static async register(req: Request, res: Response) {
    try {
      const { email, password, first_name, last_name, gender, birth_date, profile_photo_url } = req.body;
      const result = await authService.register({
        email,
        password,
        first_name,
        last_name,
        gender,
        birth_date: new Date(birth_date),
        profile_photo_url
      });
      res.status(201).json(result);
    } catch (error: any) {
      res.status(400).json({ message: error.message });
    }
  }

  static async login(req: Request, res: Response) {
    try {
      const { email, password } = req.body;
      const result = await authService.login(email, password);
      res.json(result);
    } catch (error: any) {
      res.status(401).json({ message: error.message });
    }
  }

  static async me(req: Request, res: Response) {
    // Requires auth middleware to populate req.user (not typed here yet)
    res.json((req as any).user);
  }
}
