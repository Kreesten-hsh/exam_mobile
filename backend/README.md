# Speed Dating App - Backend

Backend Node.js/Express avec MySQL et WebSocket.

## Prérequis

- Node.js (v18+)
- MySQL (Running on localhost:3306)
- Database: `speed_dating_app` (Auto-created by init script)

## Installation

```bash
cd backend
npm install
```

## Configuration

Le fichier `.env` doit contenir :

```env
PORT=3000
DB_HOST=localhost
DB_PORT=3306
DB_USERNAME=root
DB_PASSWORD=
DB_NAME=speed_dating_app
JWT_SECRET=super_secret_jwt_key_for_school_project
```

## Démarrage

1. **Initialiser la Base de Données :**

   ```bash
   npm run db:init
   ```

2. **Lancer le serveur (Dev Mode) :**
   ```bash
   npm run dev
   ```

## Architecture

- **Auth** : JWT (Register, Login, Me)
- **Events** : Gestion événements et participants.
- **Payments** : Simulation de paiement (Acompte / Total).
- **Messages** : Chat temps réel avec Socket.io et filtre anti-numéros.

## API Endpoints

- `POST /api/auth/register`
- `POST /api/auth/login`
- `GET /api/events`
- `POST /api/events/:id/register`
- `POST /api/payments/simulate` (Mock)
- `GET /api/messages/history`

## WebSocket

- Connect with `auth.token`.
- Events: `join_event`, `send_message`, `new_message`.
