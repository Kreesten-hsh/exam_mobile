# Speed Dating App - Frontend

Application mobile développée avec Flutter, suivant une architecture Clean Architecture stricte.

## Structure du Projet

- `lib/core`: Composants transversaux (Theme, Router, Constants, Errors).
- `lib/data`: Couche d'accès aux données (API, DTOs, Repositories Impl).
- `lib/domain`: Couche métier (Entities, UseCases, Repositories Interfaces).
- `lib/presentation`: Couche UI (Screens, Widgets, Providers).

## Architecture Technique

- **State Management**: Riverpod (HooksRiverpod, AsyncNotifier).
- **Navigation**: GoRouter (avec redirection auth automatique).
- **HTTP Client**: Dio (avec intercepteur d'authentification).
- **Code Generation**: Freezed, JsonSerializable, Riverpod Generator.

## Commandes Utiles

### Génération de code (Watch)

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Analyse du code

```bash
flutter analyze
```

## Setup

1.  S'assurer que le backend tourne sur le port 3000.
2.  Lancer l'application:
    ```bash
    flutter run
    ```
    _Note: Pour Android Emulator, l'API pointe sur `10.0.2.2`. Pour un device physique, changer `api_constants.dart`._
