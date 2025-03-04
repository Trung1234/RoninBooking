/RoninBooking Source Structure

    │── /src
      │   ├── /domain         # Define Entities, Aggregates, Value Objects  
      │   ├── /application    # Define Use Case, Services  
      │   ├── /infrastructure # Database, ORM, API Adapter  
      │   ├── /interfaces     # Controllers, Routes (Communicate with UI/API)  

# ✈️ Flight Booking System

## 📌 1. Introduction  
The **Flight Booking System** is a web-based platform that allows users to search, book, and manage flight tickets. It also provides functionalities for aircraft, flight, and passenger management.  

## 🚀 2. Features  

### ✅ 2.1 User Management  
- Register, login, and manage user profiles.  
- Save passenger details for faster booking.  

### ✅ 2.2 Flight Management  
- Store flight details (flight number, origin, destination, schedule, price).  
- Link flights with specific aircraft.  
- Check seat availability before booking.  

### ✅ 2.3 Booking Management  
- Search for flights based on **date, airline, seat class, etc.**  
- Select seats and enter passenger details.  
- Receive e-tickets and manage reservations.  
- Cancel bookings based on refund policies.  

### ✅ 2.4 Aircraft Management  
- Store aircraft details:  
  - **Aircraft ID**  
  - **Manufacturer** (Boeing, Airbus, etc.)  
  - **Model**  
  - **Maximum seating capacity**  
- Assign aircraft to flights.  

### ✅ 2.5 Payment System  
- Secure payments via **credit cards, e-wallets**.  
- Track payment status (`Pending`, `Paid`, `Failed`).  

### ✅ 2.6 Notifications  
- Send **email/SMS** alerts for booking confirmation and flight changes.  

---

## 📂 3. Database Schema  

### 🛫 3.1 Users Table  
| Column    | Type         | Description          |  
|-----------|-------------|----------------------|  
| `user_id` | UUID (PK)   | Unique user ID       |  
| `name`    | VARCHAR(255)| User's full name     |  
| `email`   | VARCHAR(255)| Login email          |  
| `password`| VARCHAR(255)| Encrypted password   |  
| `phone`   | VARCHAR(20) | Contact number       |  

### ✈️ 3.2 Aircraft Table  
| Column       | Type         | Description              |  
|-------------|-------------|--------------------------|  
| `aircraft_id` | UUID (PK)   | Unique aircraft ID       |  
| `manufacturer`| VARCHAR(255)| Aircraft manufacturer    |  
| `model`       | VARCHAR(255)| Aircraft model           |  
| `capacity`    | INT         | Maximum seating capacity |  

### 🛬 3.3 Flights Table  
| Column         | Type         | Description              |  
|---------------|-------------|--------------------------|  
| `flight_id`   | UUID (PK)   | Unique flight ID         |  
| `aircraft_id` | UUID (FK)   | Linked aircraft          |  
| `origin`      | VARCHAR(255)| Departure airport        |  
| `destination` | VARCHAR(255)| Arrival airport          |  
| `departure_time` | TIMESTAMP | Scheduled departure      |  
| `arrival_time`   | TIMESTAMP | Scheduled arrival        |  
| `price`       | DECIMAL(10,2)| Ticket price             |  

### 🎟️ 3.4 Bookings Table  
| Column      | Type         | Description               |  
|------------|-------------|---------------------------|  
| `booking_id` | UUID (PK)   | Unique booking ID         |  
| `user_id`   | UUID (FK)   | User who booked           |  
| `flight_id` | UUID (FK)   | Flight being booked       |  
| `status`    | VARCHAR(20) | `Pending`, `Confirmed`, `Cancelled` |  
| `total_price` | DECIMAL(10,2)| Total booking amount    |  

### 💳 3.5 Payments Table  
| Column         | Type         | Description               |  
|---------------|-------------|---------------------------|  
| `payment_id`  | UUID (PK)   | Unique payment ID         |  
| `booking_id`  | UUID (FK)   | Linked booking ID         |  
| `payment_status` | VARCHAR(20) | `Pending`, `Paid`, `Failed` |  
| `payment_method` | VARCHAR(50) | Credit card, E-wallet   |  

---

##  4. Hashing Password Method 

### ✅ 4.1 Script : slow but safe
SCrypt is a more memory-intensive hashing algorithm compared to BCrypt, making it more resistant to brute-force and hardware-accelerated attacks.

BCrypt vs. SCrypt in Java

| Feature         | BCrypt         | SCrypt               |  
|---------------|-------------|---------------------------|  
| `Speed`  | Slower than MD5 but optimized  | Slower than BCrypt (more secure)         |  
| `Security`  | Good, but vulnerable to GPU attacks)   | Better against GPU-based brute force        |  
| `Memory Use` | Low | High (memory-hard function)|  
| `Best for` | Web apps, authentication | High-security applications   |  


		
If you need stronger security (e.g., protection against ASIC/GPU attacks), SCrypt is a better choice.
## 🌐 5. API Endpoints  

### ✈️ 4=5.1 Flight Search API  
```http
GET /api/flights/search?origin=SGN&destination=HAN&date=2025-03-10

--- 


