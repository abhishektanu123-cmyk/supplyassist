Supply Assist – Supply Chain Disruption Simulation & Mitigation Application
1. Overview

Supply Assist is an Android-based decision-support application developed to analyze, simulate, and mitigate supply chain disruptions. The application focuses on supplier risk monitoring, disruption impact analysis, and mitigation decision-making. It is designed as a prototype to demonstrate how digital tools can support proactive supply chain risk management in manufacturing and logistics environments.

The user interface was designed using FlutterFlow and integrated into Android Studio, where the business logic, database connections, and state management were implemented using Flutter.

2. Core Functionality

The application provides the following key features:

User authentication and session-based navigation

Home dashboard displaying supply chain overview widgets

Supplier dashboard with supplier list, risk scores, and filtering (High / Medium / Low)

Alert and notification screen for supplier availability changes

Simulation screen allowing users to:

Select a supplier

Choose disruption intensity (Low, Medium, High)

Run a disruption simulation

Disruption impact screen showing:

Simulated risk level

Availability change

Bottleneck identification

Geographic exposure

Quick mitigation screen supporting crisis response and backup supplier decision-making

PDF generation of disruption impact results for reporting and documentation

3. Application Flow

User logs in to the application

Home screen loads with dashboard widgets

Supplier dashboard allows viewing and filtering suppliers by risk level

Alert screen displays availability or risk changes

Simulation screen allows the user to configure and run a disruption scenario

Disruption impact screen presents simulated results and identified risks

User may choose to expedite and navigate to the quick mitigation screen

Optional PDF report can be generated from the disruption impact screen

4. Technology Stack

Flutter framework

FlutterFlow for UI design

Android Studio for development and integration

Firebase Firestore as the database

Provider for state management

Android Emulator (Google Pixel 7) for testing

5. Testing

The application was tested exclusively using the Android Emulator configured to replicate a Google Pixel 7 device. All major user flows, including simulation execution, navigation, and PDF generation, were validated in the emulator environment.

6. Known Limitations

Risk calculation logic is simplified and rule-based

Supplier availability changes are simulated rather than real-time

No integration with ERP, logistics, or external supplier systems

Backup supplier selection is based on predefined logic, not AI optimization

Tested only on an Android emulator, not on physical devices

No role-based access control or multi-user permissions

7. Planned but Not Implemented Feature

EU Risk Heatmap

An EU-level geographic risk heatmap was planned to visualize supplier distribution and regional disruption exposure across Europe. Due to time constraints, this feature was not implemented in the current version. The planned functionality included country-based risk visualization and integration with simulation results.

8. Disclaimer

This application is a prototype developed for academic and demonstration purposes only. All supplier data and simulation outputs are either synthetic or simplified and should not be used for real operational decision-making.