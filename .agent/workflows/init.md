---
description: Project initialization and architecture overview - READ BEFORE EVERY TASK
---

# 🚀 Delivery App - Project Initialization

> **CRITICAL**: Read this file completely before starting any task or feature implementation.

## 📋 Project Overview

**Project Name**: `delivery_app`  
**Type**: Food Delivery Mobile Application  
**SDK**: Dart ^3.10.7  
**Framework**: Flutter (Multi-platform: Android, iOS, Web, Windows, Linux, macOS)

## 🏗️ Architecture Pattern

This project follows **Clean Architecture** with a feature-based structure:

```
lib/
├── core/                    # Shared utilities across features
│   ├── di/                  # Dependency Injection (get_it)
│   ├── helpers/             # Extensions and helper functions
│   ├── networking/          # API service, dio, retrofit
│   ├── routing/             # App router and routes
│   ├── theme/               # Colors, text styles, theme config
│   └── widgets/             # Reusable widgets (AppTextFormField)
│
└── features/                # Feature modules (Clean Architecture)
    ├── auth/
    │   ├── data/            # Models, repositories, data sources
    │   ├── logic/           # BLoC/Cubit state management
    │   └── ui/              # Screens and widgets
    │       ├── *_screen.dart
    │       └── widgets/     # Feature-specific widgets
    │
    └── home/
        ├── data/
        ├── logic/
        └── ui/
```

### Layer Responsibilities

1. **Data Layer** (`data/`)
   - Data models with `json_serializable`
   - Repository implementations
   - Remote/local data sources
   - API calls via `retrofit` + `dio`

2. **Logic Layer** (`logic/`)
   - **BLoC/Cubit** for state management (`flutter_bloc`)
   - Business logic
   - State classes

3. **UI Layer** (`ui/`)
   - Screens (e.g., `login_screen.dart`)
   - Widgets directory for feature-specific components
   - **Each widget file should be <= 60 lines** (decompose if larger)

## 🛠️ Tech Stack

### Core Dependencies

| Package                       | Purpose                                  |
| ----------------------------- | ---------------------------------------- |
| `flutter_bloc` (^9.1.1)       | State management (BLoC/Cubit pattern)    |
| `get_it` (^9.2.0)             | Dependency injection                     |
| `flutter_screenutil` (^5.9.3) | Responsive design (design size: 375x812) |

### Networking

| Package                       | Purpose               |
| ----------------------------- | --------------------- |
| `dio` (^5.9.0)                | HTTP client           |
| `retrofit` (^4.9.2)           | Type-safe REST client |
| `pretty_dio_logger` (^1.4.0)  | Network logging       |
| `json_serializable` (^6.11.4) | JSON serialization    |

### UI/UX

| Package                          | Purpose           |
| -------------------------------- | ----------------- |
| `flutter_svg` (^2.2.3)           | SVG image support |
| `cached_network_image` (^3.4.1)  | Image caching     |
| `flutter_native_splash` (^2.4.7) | Splash screen     |

### Storage

| Package                       | Purpose                 |
| ----------------------------- | ----------------------- |
| `shared_preferences` (^2.5.4) | Local key-value storage |

### Dev Dependencies

| Package                  | Purpose         |
| ------------------------ | --------------- |
| `build_runner` (^2.10.5) | Code generation |
| `flutter_lints` (^6.0.0) | Linting rules   |

## 🎨 Design System

### Screen Size

- **Design Reference**: 375x812 (iPhone X)
- **Implementation**: All sizes use `.w`, `.h`, `.sp`, `.r` from `flutter_screenutil`

### Colors (`AppColors`)

```dart
// Brand
primary = #FF7622 (Orange)
primarySoft = #FFE1CE
primaryLight = #FFD27C

// Backgrounds
scaffold = #F7F8F9
surface = #FFFFFF
card = #F6F6F6
input = #F0F5FA
authBackGround = #121223 (Dark)

// Text
textPrimary = #181C2E
textDark = #2D2D2D
textMedium = #32343E
textSecondary = #646982
textHint = #A0A5BA
```

### Text Styles (`AppTextStyles`)

Access via context extensions:

```dart
context.font28TextPrimaryBold       // displayLarge
context.font22TextPrimarySemiBold   // displayMedium
context.font18TextMediumSemiBold    // displaySmall
context.font16TextDarkRegular       // bodyLarge
context.font14TextSecondaryRegular  // bodyMedium
context.font13TextHintRegular       // bodySmall
context.font16WhiteSemiBold         // labelLarge
context.font11TextHintMedium        // labelSmall
```

### Theme

- **Material 3**: Enabled (`useMaterial3: true`)
- **Mode**: System-based (`ThemeMode.system`)
- **Defined in**: `lib/core/theme/app_theme.dart`

## 📐 Coding Patterns & Conventions

### 1. Widget Composition

- **Break down large widgets** into smaller, reusable components
- **Widget files ≤ 60 lines** (strict guideline)
- Use **private widget classes** instead of helper methods returning widgets
- Example from auth feature:
  ```dart
  // ✅ Good: Small widget files in widgets/
  widgets/
    ├── auth_header.dart
    ├── auth_form_container.dart
    ├── email_text_form_field.dart
    ├── password_text_form_field.dart
    └── login_button.dart
  ```

### 2. Responsive Design

- **Always use `flutter_screenutil`** for sizing:

  ```dart
  // Width/Height
  24.w  // width
  24.h  // height

  // Text size
  16.sp // font size

  // Radius
  12.r  // border radius

  // Spacing
  16.verticalSpace   // SizedBox(height: 16.h)
  16.horizontalSpace // SizedBox(width: 16.w)
  ```

### 3. Navigation

- **Router**: Custom `AppRouter` with `onGenerateRoute`
- **Routes**: Defined in `lib/core/routing/routes.dart`
- **Extension methods**: Use context extensions from `lib/core/helpers/extensions.dart`
  ```dart
  context.pushNamed(Routes.homeScreen);
  context.pushReplacementNamed(Routes.loginScreen);
  context.pushNamedAndRemoveUntil(Routes.homeScreen, (route) => false);
  context.pop();
  ```

### 4. State Management (BLoC/Cubit)

- Use **Cubit** for simple state
- Use **BLoC** for complex event-driven state
- Place in `features/{feature}/logic/`
- **Naming**: `{Feature}Cubit` or `{Feature}Bloc`

### 5. Form Fields

- Extend `AppTextFormField` from `core/widgets/`
- Create feature-specific wrappers in `ui/widgets/`
- Example:
  ```dart
  class EmailTextFormField extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return AppTextFormField(
        hintText: 'Your Email',
        validator: (value) => // validation logic
      );
    }
  }
  ```

### 6. Extensions

- **Navigation**: `context.pushNamed()`, `context.pop()`
- **Theme**: `context.theme`, `context.textTheme`, `context.colorScheme`
- **Text Styles**: `context.font14TextSecondaryRegular`, etc.

### 7. Naming Conventions

- **Files**: `snake_case.dart`
- **Classes**: `PascalCase`
- **Variables/Functions**: `camelCase`
- **Constants**: `camelCase` (in static classes like `AppColors`)
- **Routes**: `Routes.{screen}Screen`

## 🔧 Development Workflow

### Before Every Feature/Task

1. **Read this file** (`init.md`)
2. Identify which feature the task belongs to
3. Follow Clean Architecture layers (data/logic/ui)
4. Ensure widget files stay ≤ 60 lines

### Code Generation

When using `json_serializable` or `retrofit`:

```bash
# Run code generation
dart run build_runner build --delete-conflicting-outputs

# Watch mode (auto-rebuild)
dart run build_runner watch --delete-conflicting-outputs
```

### Running the App

```bash
# Check devices
flutter devices

# Run on specific device
flutter run -d <device-id>

# Run with hot reload (default)
flutter run
```

### Dependency Management

```bash
# Add dependency
flutter pub add <package_name>

# Add dev dependency
flutter pub add dev:<package_name>

# Update dependencies
flutter pub get
```

## 📂 Asset Organization

```yaml
assets/
  ├── images/     # PNG, JPG images
  └── svgs/       # SVG icons
```

**Usage**:

```dart
// Images
Image.asset('assets/images/logo.png')

// SVGs
SvgPicture.asset('assets/svgs/icon.svg')
```

## 🧪 Testing Strategy

- Place tests in `test/` directory
- Mirror the `lib/` structure
- Use `flutter_test` for widget tests
- Use `flutter_bloc_test` for BLoC/Cubit tests

## 🚨 Important Rules

### MUST DO ✅

1. **Always** use `flutter_screenutil` for responsive sizing
2. **Always** follow Clean Architecture (data/logic/ui)
3. **Always** keep widget files ≤ 60 lines
4. **Always** use context extensions for navigation and theme
5. **Always** run code generation after modifying models/API service
6. **Always** use `AppTextFormField` as base for form inputs
7. **Always** define routes in `Routes` class before using them

### MUST NOT DO ❌

1. **Never** hardcode sizes (use `.w`, `.h`, `.sp`, `.r`)
2. **Never** use `Navigator.pushNamed` directly (use context extensions)
3. **Never** put business logic in UI layer
4. **Never** commit generated files (`.g.dart`) without running build_runner
5. **Never** create deep widget nesting (extract to smaller widgets)
6. **Never** use colors directly (always use `AppColors`)
7. **Never** use text styles directly (use `AppTextStyles` or context extensions)

## 🔄 Current Project State

### Implemented Features

- ✅ **Auth Feature**: Login screen, Sign-up screen (UI only, no logic yet)
- ✅ **Core Setup**: Routing, theme, networking foundation
- ⏳ **Home Feature**: Shell created, not implemented

### Active Development

- Auth feature UI is complete
- Next: Implement auth logic (BLoC/Cubit), data layer, API integration

## 📞 API Configuration

- **Base URL**: Defined in `lib/core/networking/api_constant.dart`
- **Service**: `lib/core/networking/api_service.dart` (Retrofit)
- **Factory**: `lib/core/networking/dio_factory.dart` (Dio setup)

## 🎯 Next Steps for New Features

1. **Create feature folder** in `lib/features/{feature_name}/`
2. **Create three layers**:
   - `data/` → models, repositories
   - `logic/` → cubits/blocs
   - `ui/` → screens and widgets
3. **Add route** to `lib/core/routing/routes.dart`
4. **Register route** in `lib/core/routing/app_router.dart`
5. **Follow widget composition** (≤ 60 lines per file)
6. **Use DI** via `get_it` for repositories and services

---

**Last Updated**: 2026-01-29  
**Maintainer**: Development Team

> Remember: This is a **living document**. Update it as the project evolves!
