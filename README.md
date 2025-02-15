# Online Shop

This project is an Online Shop application with a frontend built using Flutter (Dart) and a backend built using Java. The application allows users to browse products, view details, and manage their shopping basket. The backend provides user authentication, product management, and database operations.

## Features

- User authentication (Login and Sign Up)
- Browse products by category
- View product details
- Manage shopping basket
- Search functionality
- Responsive UI

## Prerequisites

### Frontend

- Flutter SDK
- Dart SDK

### Backend

- Java 11+
- MySQL database

## Getting Started

### Frontend

1. **Clone the repository:**
   `sh
   git clone https://github.com/Mohimor/online-shop.git
   cd online-shop/frontend
**Install dependencies:**

sh
   flutter pub get

**Run the application:**

sh
   flutter run
   
Backend

**Clone the repository:**

sh
   git clone https://github.com/Mohimor/online-shop.git
   cd online-shop/backend

**Set up the MySQL database:**

Create a database named products

Create tables for mobiles, laptops, headphones, and tablets with appropriate columns

Update database configuration: Update the database connection details in SQLDatabaseManager.java:

java
   private static final String URL = "jdbc:mysql://localhost:3306/products";
   private static final String USER = "root";
   private static final String PASSWORD = "your_password";
   
**Run the backend server:**

sh
   javac Main.java
   java Main
   
***Project Structure***

**Frontend**

* LoginPage.dart: Login page UI and logic

* SignupPage.dart: Sign Up page UI and logic

* Shopingbasket.dart: Shopping basket UI and logic

* MainMaterial.dart: Main application entry point

* CategoriDetailPage.dart: Category detail page UI and logic

* descriptionPage.dart: Product description page UI and logic

* shopbottemna.dart: Bottom navigation bar UI and logic

* ShopingBasketdata.dart: Shopping basket data management

* Shopingbasketitem.dart: Shopping basket item UI and logic

* Item.dart: Item model for category items

* ItemDetail.dart: ItemDetail model for product details

**Backend**

* Main.java: Main entry point for the server

* Server.java: Server socket management

* Clihandler.java: Client handler for managing client connections

* Commandmng.java: Command manager for handling client commands

* Authenticator.java: Authentication logic for user login and sign up

* Databasemng.java: Database management for user data and product data

* Product.java: Product management logic

* SQLDatabaseManager.java: Database connection and query execution

***Usage***

* User Authentication
* Users can sign up by providing a username, password, and email.

* Users can log in using their username and password.

* The server authenticates users and manages sessions.

* Browsing Products

* Users can browse products by category.

* Each category displays a list of products with images and names.

* Users can view detailed information about each product, including price and description.

* Managing Shopping Basket

* Users can add products to their shopping basket.

* Users can view and manage items in their shopping basket.

* Users can increment or decrement the quantity of each item.

* Users can remove items from the basket.

*Searching Products

*Users can search for products using the search functionality.

*The search results display matching products with images and names.
