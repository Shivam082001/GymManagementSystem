Create Database GymManagementSystem
use GymManagementSystem
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactNumber NVARCHAR(20),
    Email NVARCHAR(100),
    JoinDate DATE
);

-- Create Subscriptions table
CREATE TABLE Subscriptions (
    SubscriptionID INT PRIMARY KEY,
    MemberID INT,
    StartDate DATE,
    EndDate DATE,
    SubscriptionType NVARCHAR(50),
    AmountPaid DECIMAL(10, 2),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Create Trainers table
CREATE TABLE Trainers (
    TrainerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactNumber NVARCHAR(20),
    Email NVARCHAR(100),
    HireDate DATE,
    Specialization NVARCHAR(100)
);

-- Create Classes table
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName NVARCHAR(100),
    Description TEXT,
    Schedule NVARCHAR(200),
    TrainerID INT,
    MaxCapacity INT,
    FOREIGN KEY (TrainerID) REFERENCES Trainers(TrainerID)
);

-- Create Attendance table
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    MemberID INT,
    ClassID INT,
    AttendanceDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

-- Create Payments table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    MemberID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentType VARCHAR(50),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
); 