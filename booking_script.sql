-- Create the database
--CREATE DATABASE BookFlights;
--GO

USE BookFlights
CREATE TABLE Flights (
    FlightID UNIQUEIDENTIFIER  PRIMARY KEY ,
    FlightNumber VARCHAR(10) NOT NULL,
    DepartureAirport VARCHAR(100) NOT NULL,
    ArrivalAirport VARCHAR(100) NOT NULL,
    DepartureTime DATETIME NOT NULL,
    ArrivalTime DATETIME NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    SeatsAvailable INT NOT NULL
);

CREATE TABLE Bookings (
    BookingID UNIQUEIDENTIFIER  PRIMARY KEY ,
    FlightID INT NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    CustomerEmail VARCHAR(100) NOT NULL,
    BookingDate DATETIME NOT NULL DEFAULT GETDATE(),
    SeatsBooked INT NOT NULL,
);


CREATE TABLE Payments (
    PaymentID UNIQUEIDENTIFIER  PRIMARY KEY ,
    BookingID INT NOT NULL,
    PaymentDate DATETIME NOT NULL DEFAULT GETDATE(),
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    PaymentStatus VARCHAR(20) NOT NULL,
);


CREATE TABLE BookingHistory (
    HistoryID UNIQUEIDENTIFIER  PRIMARY KEY ,
    BookingID INT NOT NULL,
    ChangeDate DATETIME NOT NULL DEFAULT GETDATE(),
    ChangeDescription VARCHAR(255) NOT NULL
);