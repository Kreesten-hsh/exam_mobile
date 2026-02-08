# 📱 SpeedDating - Application Événementielle & Chat Sécurisé

Bienvenue sur le dépôt du projet **SpeedDating**. Une application mobile moderne de rencontres et d'événements, conçue pour offrir une expérience utilisateur premium et sécurisée.

---

## 🏗️ Architecture du Projet

Le projet est structuré en deux parties distinctes (Monorepo) :

```
exam_mobile/
├── 📂 backend/         # API RESTful (Node.js / Express / TypeScript)
└── 📂 frontend/        # Application Mobile (Flutter / Dart)
```

### 1. Backend (`/backend`)

Architecture en couches (MSC - Model, Service, Controller) :

- **Technologies** : Node.js, Express, TypeScript, TypeORM, MySQL, Socket.io.
- **Sécurité** : Authentification JWT, Validation DTO, Hachage Bcrypt.
- **Features** : Gestion des événements, inscriptions, chat temps réel, upload de fichiers.

### 2. Frontend (`/frontend`)

**Clean Architecture** rigoureuse avec séparation des responsabilités :

- **Présentation** : Widgets, Riverpod Providers (State Management).
- **Domaine** : Entités (Business Logic), Repository Interfaces, UseCases.
- **Data** : Repository Implementations, Data Sources (API/Local), DTOs via `frozen` & `json_serializable`.
- **Networking** : Dio avec intercepteurs pour la gestion automatique des tokens.

---

## 🚀 Guide d'Installation & Démarrage

### Pré-requis

- **Node.js** (v18+) & npm
- **Flutter SDK** (Channel stable, v3.x+)
- **MySQL Server** (local ou distant)
- **Git**

### 1️⃣ Cloner le dépôt

```bash
git clone https://github.com/Kreesten-hsh/exam_mobile.git
cd exam_mobile
```

### 2️⃣ Configuration du Backend

1.  Accédez au dossier backend :
    ```bash
    cd backend
    ```
2.  Installez les dépendances :
    ```bash
    npm install
    ```
3.  Configurez les variables d'environnement :
    - Créez un fichier `.env` à la racine de `/backend`.
    - Ajoutez-y les informations suivantes (adaptez selon votre config MySQL) :
    ```env
    PORT=3000
    DB_HOST=localhost
    DB_PORT=3306
    DB_USER=root
    DB_PASS=votre_mot_de_passe
    DB_NAME=exam_mobile_db
    JWT_SECRET=votre_secret_tres_securise
    ```
4.  Lancez le serveur (Development) :
    ```bash
    npm run dev
    ```
    ✅ _Le serveur doit afficher : `Server is running on port 3000` & `Data Source has been initialized!`_

### 3️⃣ Configuration du Frontend

1.  Accédez au dossier frontend (dans un nouveau terminal) :
    ```bash
    cd frontend
    ```
2.  Installez les dépendances Flutter :
    ```bash
    flutter pub get
    ```
3.  **Génération de code** (Important pour `Riverpod` & `Freezed`) :
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
4.  **Configuration API** :
    - Ouvrez `lib/core/constants/api_constants.dart`.
    - Modifiez `baseUrl` avec l'adresse IP locale de votre machine (ex: `192.168.1.XX`) pour que l'émulateur/téléphone puisse accéder au backend.
    ```dart
    static const String baseUrl = 'http://192.168.1.68:3000/api'; // Exemple
    ```

### 4️⃣ Lancer l'Application

- Assurez-vous qu'un émulateur est lancé ou qu'un appareil physique est connecté.
- Lancez l'app :
  ```bash
  flutter run
  ```

---

## ✨ Fonctionnalités Clés

### 🔐 Authentification Complète

- Inscription multi-étapes (Nom, Age, Genre, Photo).
- Connexion sécurisée avec persistance de session (Auto-Login).
- Gestion de profil et Avatar automatique par genre.

### 📅 Découverte d'Événements (Premium UI)

- Fil d'actualité fluide avec animations.
- Détails de l'événement : Lieux, Dates, Prix, Quotas (Hommes/Femmes).
- Inscription en un clic.

### 💬 Chat Temps Réel (Socket.io)

- **Messagerie Instantanée** : Communication fluide 1-on-1 entre participants d'un événement.
- **Optimistic UI** : Affichage immédiat des messages pour une sensation de rapidité.
- **Vocal** : Envoi et lecture de notes audio.
- **Sécurité** : Filtre anti-spam et blocage des échanges de numéros/réseaux sociaux pour protéger les utilisateurs.

---

## 🛠️ Commandes Utiles

| Commande                             | Dossier     | Description                                         |
| :----------------------------------- | :---------- | :-------------------------------------------------- |
| `npm run dev`                        | `backend/`  | Lance le serveur en mode développement (watch).     |
| `npm run build`                      | `backend/`  | Compile le TypeScript en JavaScript pour la prod.   |
| `flutter run`                        | `frontend/` | Lance l'application mobile en mode Debug.           |
| `flutter build apk`                  | `frontend/` | Génère l'APK pour Android.                          |
| `flutter analyze`                    | `frontend/` | Vérifie la qualité du code (Linting).               |
| `flutter pub run build_runner build` | `frontend/` | Régénère les fichiers `.g.dart` et `.freezed.dart`. |

---

## ❓ Dépannage (Troubleshooting)

**L'application n'arrive pas à se connecter au backend (Network Error) ?**

1.  Vérifiez que votre téléphone/émulateur et votre PC sont sur le **même réseau WiFi**.
2.  Vérifiez votre adresse IP locale (`ipconfig` sur Windows).
3.  Mettez à jour `ipAddress` dans `frontend/lib/core/constants/api_constants.dart`.
4.  Si vous êtes sur Windows, vérifiez que le **Pare-feu** autorise le port 3000 (Node.js).

**Erreur de compilation Frontend ?**

- Exécutez `flutter clean` puis `flutter pub get`.
- Relancez `flutter pub run build_runner build --delete-conflicting-outputs`.

---

_Développé avec ❤️ par le groupe No 5_
