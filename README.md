# My Portfolio App

A Flutter-based portfolio application showcasing my profile, skills, interests, and projects. Built with Flutter and Dart, this app demonstrates a clean UI, smooth navigation, and integration with device features like URL launching.

---

## Table of Contents
- [Features](#features)
- [Demo](#demo)
- [Screenshots](#screenshots)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
- [Project Structure](#project-structure)
- [Dependencies](#dependencies)
- [Customization](#customization)
- [License](#license)

---

## Features
- **Profile Section:** Circular avatar, name, and role.
- **Short Bio:** A brief introduction with centered text.
- **Contact Info:** Email, phone, GitHub, and LinkedIn links.
- **Skills & Technologies:** Displayed as `Chip` widgets in a wrap layout.
- **Interests:** Expandable tiles for:
    - Web & Mobile Application Development
    - Cybersecurity
    - Networking
    - Software Development & Engineering
    - Databases
- **Projects:** Custom `ProjectCard` widget showing image, title, description, tech stack, and a clickable repository link.
- **Smooth Scrolling:** Popup menu for quick navigation between sections.

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Android Studio or VS Code with Flutter & Dart plugins
- Android emulator or iOS simulator / physical device

### Installation
1. **Clone the repository**
   ```bash
   git clone https://github.com/lucifron28/cada_portfolio.git
   cd cada_portfolio
   ```
2. **Install dependencies**
   ```bash
   flutter pub get
   ```
3. **Add assets**
   Ensure the following assets are present and declared in `pubspec.yaml`:
   ```yaml
   flutter:
     assets:
       - assets/profile.jpeg
       - assets/icons/github.png
       - assets/icons/linkedin.png
       - assets/pixel-pages.png
       - assets/fav-music.png
       - assets/coffee-crumbs.png
   ```
4. **Run the app**
   ```bash
   flutter run
   ```

---

## Project Structure
```
/lib
 ├─ main.dart            # Entry point and homepage definition
 ├─ widgets
 │   └─ project_card.dart # `ProjectCard` widget
/assets
 ├─ profile.jpeg         # Profile avatar image
 ├─ icons
 │   ├─ github.png       # GitHub icon
 │   └─ linkedin.png     # LinkedIn icon
 ├─ pixel-pages.png      # Project screenshot
 ├─ fav-music.png        # Project screenshot
 └─ coffee-crumbs.png    # Project screenshot
pubspec.yaml             # Flutter config and dependencies
README.md                # This file
```

---

## Dependencies
- **Flutter** (>=3.0.0)
- **url_launcher**: Launch external URLs in browser
- **material_design_icons_flutter** (optional): For icons if used

Check `pubspec.yaml` for exact versions.

---

## Customization
- **Theme:** Modify `ThemeData` in `main.dart` for colors, typography, and card styling.
- **Sections:** Edit expansion tile texts in `PortfolioHomePage`.
- **Projects:** Update the list of `ProjectCard` instances with your own titles, descriptions, and repo URLs.

---


## License
This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
