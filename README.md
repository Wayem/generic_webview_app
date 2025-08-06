# Generic Webview App

Application Flutter minimaliste affichant une page web dans une WebView et prête à recevoir des notifications push via Firebase Cloud Messaging (FCM).

## Fonctionnalités
- Affiche une page web directement dans l'application sans barre d'URL.
- Demande la permission d'envoyer des notifications push dès le lancement.
- Intégration basique de Firebase Core et Messaging pour recevoir des notifications FCM (ajoutez vos fichiers de configuration).

## Configuration Firebase
1. Créez un projet Firebase et activez **Firebase Cloud Messaging**.
2. Téléchargez les fichiers de configuration et placez-les :
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist`
3. Les fichiers présents dans le dépôt sont des modèles à remplacer par vos propres fichiers.

## Workflow de développement
```bash
# Récupérer les dépendances
flutter pub get

# Lancer l'application en mode debug (Android ou iOS connecté)
flutter run

# Synchroniser/mettre à jour les dépendances
flutter pub upgrade

# Nettoyer les artefacts de build
flutter clean
```

### Ouvrir le projet Android dans Android Studio
```bash
flutter pub get
# Puis ouvrir le dossier `android/` dans Android Studio
```

## Build
### Ubuntu / Android APK
```bash
# Générer un APK de debug
flutter build apk

# Générer un APK de release
flutter build apk --release
```

### iOS / App Store
```bash
# Générer une archive iOS (sans signature)
flutter build ios --no-codesign

# Générer un IPA pour distribution
flutter build ipa
```

Les étapes supplémentaires de signature et de publication sur les stores doivent être réalisées selon la documentation officielle de [Flutter](https://docs.flutter.dev) et de [Firebase](https://firebase.google.com/docs).
