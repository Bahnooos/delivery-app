# Delivery App Documentation

## Table of Contents
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Project Structure](#project-structure)
- [Screens](#screens)
  - [Authentication Screens](#authentication-screens)
  - [Main Application Screens](#main-application-screens)
- [Getting Started](#getting-started)
- [Configuration](#configuration)
- [Contributing](#contributing)
- [License](#license)

## Features
- User authentication with secure login and signup.
- Delivery tracking in real-time.
- Order history management.
- User profile management.

## Installation
1. Clone the repository.
2. Run `npm install` to install dependencies.
3. Set up environment variables as per the `.env.example` file.`

## Screens

### Authentication Screens
#### Splash Screen
- **Purpose**: Show the app logo and loading sequence.
- **Features**: Navigation to Login or Signup based on user state.
- **Navigation Flow**: Automatically navigates after a short period.

#### Login Screen
- **Purpose**: Authenticate existing users.
- **Features**: Input fields for email and password, submit button.
- **User Flow**: User inputs credentials and navigates to the home screen if successful.

#### Signup Screen
- **Purpose**: Register new users.
- **Features**: Input fields for user details, validate inputs.
- **User Flow**: User submits details and receives a confirmation email.

#### Password Reset Screen
- **Purpose**: Allow users to reset their password.
- **Features**: Input field for email; send OTP.
- **User Flow**: User enters email and receives reset instructions.

#### OTP Verification Screen
- **Purpose**: Verify OTP for actions like password reset.
- **Features**: Input field for OTP, submit button.
- **User Flow**: User enters received OTP to proceed.

### Main Application Screens
#### Home Screen
- **Purpose**: Display main options for the user.
- **Features**: Navigation to Delivery Tracking, Order History, Profile.

#### Delivery Tracking Screen
- **Purpose**: Show the user's active deliveries.
- **Features**: Map view, delivery status updates.

#### Order History Screen
- **Purpose**: Display past orders for the user.
- **Features**: List of orders, details on click.

#### Profile Screen
- **Purpose**: Allow users to manage their profile.
- **Features**: Edit details, change password.

#### Order Details Screen
- **Purpose**: Show detailed information for a specific order.
- **Features**: Item details, delivery status, contact support.

## Getting Started
To get started, follow the installation instructions and run the app using `npm start`.

## Configuration
Ensure you configure your database connection in the environment variables.

## Contributing
Feel free to submit issues or create pull requests for enhancements and fixes.

## License
This project is licensed under the MIT License.
