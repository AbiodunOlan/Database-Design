-- Customer Table
CREATE TABLE bookstore.Customer (
    customerID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    address TEXT
);

-- Book Table
CREATE TABLE bookstore.Book (
    bookID INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stockQuantity INT NOT NULL,
    genre VARCHAR(100),
    ISBN VARCHAR(13) UNIQUE NOT NULL
);

-- Cart Table
CREATE TABLE bookstore.Cart (
    cartID INT PRIMARY KEY,
    customerID INT NOT NULL,
    FOREIGN KEY (customerID) REFERENCES bookstore.Customer(customerID) ON DELETE CASCADE
);

-- CartItem Table (Associates books with a cart)
CREATE TABLE bookstore.CartItem (
    itemID INT PRIMARY KEY,
    cartID INT NOT NULL,
    bookID INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (cartID) REFERENCES bookstore.Cart(cartID) ON DELETE CASCADE,
    FOREIGN KEY (bookID) REFERENCES bookstore.Book(bookID) ON DELETE CASCADE
);

-- Order Table
CREATE TABLE bookstore.OrderTable (
    orderID INT PRIMARY KEY,
    customerID INT NOT NULL,
    orderDate DATE NOT NULL,
    status VARCHAR(50) CHECK (status IN ('pending', 'shipped', 'delivered')),
    totalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customerID) REFERENCES bookstore.Customer(customerID) ON DELETE CASCADE
);

-- OrderItem Table (Associates books with an order)
CREATE TABLE bookstore.OrderItem (
    orderItemID INT PRIMARY KEY,
    orderID INT NOT NULL,
    bookID INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (orderID) REFERENCES bookstore.OrderTable(orderID) ON DELETE CASCADE,
    FOREIGN KEY (bookID) REFERENCES bookstore.Book(bookID) ON DELETE CASCADE
);

-- Payment Table
CREATE TABLE bookstore.Payment (
    paymentID INT PRIMARY KEY,
    orderID INT UNIQUE NOT NULL,
    paymentMethod VARCHAR(50) CHECK (paymentMethod IN ('credit card', 'PayPal')),
    paymentStatus VARCHAR(50) CHECK (paymentStatus IN ('pending', 'completed')),
    amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (orderID) REFERENCES bookstore.OrderTable(orderID) ON DELETE CASCADE
);

-- Shipping Table
CREATE TABLE bookstore.Shipping (
    shippingID INT PRIMARY KEY,
    orderID INT UNIQUE NOT NULL,
    shippingMethod VARCHAR(50) CHECK (shippingMethod IN ('standard', 'express')),
    shippingCost DECIMAL(10, 2) NOT NULL,
    shippingStatus VARCHAR(50) CHECK (shippingStatus IN ('pending', 'shipped', 'delivered')),
    FOREIGN KEY (orderID) REFERENCES bookstore.OrderTable(orderID) ON DELETE CASCADE
);
