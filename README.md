# BuyBox - Flutter E-commerce Showcase

BuyBox is a modern, high-quality Flutter e-commerce application designed to demonstrate professional development standards, including clean architecture, robust state management, and idiomatic Dart code.

## 🚀 Features

- **Onboarding Flow**: Smooth introduction to the app's value proposition.
- **Authentication**: Modern Sign In and Register screens.
- **Dynamic Home Screen**: Categorized products, promotional carousels, and personalized greetings.
- **Advanced Search**: Custom search delegate with recent searches and real-time filtering.
- **Shopping Cart**: Real-time state management for cart operations.
- **Responsive UI**: Built with a "Feature-first" approach for scalability.

## 🏗️ Architecture

The project follows a **Feature-First Clean Architecture**:

- **`core/`**: Global themes, constants, and utilities.
- **`features/`**: Modularized by functionality (Auth, Home, Shop, Search).
  - **`domain/`**: Pure business logic, models, and repository interfaces.
  - **`data/`**: Repository implementations and data sources (API/Mock).
  - **`presentation/`**: UI components (Screens & Widgets) and State Management (Providers).

## 🛠️ Tech Stack

- **Flutter SDK**: `3.24.3` (managed via FVM)
- **State Management**: [Provider](https://pub.dev/packages/provider)
- **Networking**: [Dio](https://pub.dev/packages/dio) (Planned/Ready)
- **Icons**: FontAwesome & Cupertino Icons
- **UI Components**: Carousel Slider, Smooth Page Indicator

## 📦 Getting Started

### Prerequisites

- [FVM](https://fvm.app/) (Recommended)
- Flutter SDK `3.24.3`

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/buybox.git
   ```
2. Navigate to the project directory:
   ```bash
   cd buybox
   ```
3. Install dependencies:
   ```bash
   fvm flutter pub get
   ```
4. Run the app:
   ```bash
   fvm flutter run
   ```

## 🧪 Testing

The project is structured to be easily testable. You can run the tests using:
```bash
fvm flutter test
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
