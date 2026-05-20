
IF OBJECT_ID('dbo.Complaint','U') IS NOT NULL DROP TABLE dbo.Complaint;
IF OBJECT_ID('dbo.Discount','U') IS NOT NULL DROP TABLE dbo.Discount;
IF OBJECT_ID('dbo.Review','U') IS NOT NULL DROP TABLE dbo.Review;
IF OBJECT_ID('dbo.Payment','U') IS NOT NULL DROP TABLE dbo.Payment;
IF OBJECT_ID('dbo.Order_Item','U') IS NOT NULL DROP TABLE dbo.Order_Item;
IF OBJECT_ID('dbo.Order','U') IS NOT NULL DROP TABLE dbo."Order";
IF OBJECT_ID('dbo.Cart_Item','U') IS NOT NULL DROP TABLE dbo.Cart_Item;
IF OBJECT_ID('dbo.Cart','U') IS NOT NULL DROP TABLE dbo.Cart;
IF OBJECT_ID('dbo.Product','U') IS NOT NULL DROP TABLE dbo.Product;
IF OBJECT_ID('dbo.Category','U') IS NOT NULL DROP TABLE dbo.Category;
IF OBJECT_ID('dbo.Admin','U') IS NOT NULL DROP TABLE dbo.Admin;
IF OBJECT_ID('dbo.Seller','U') IS NOT NULL DROP TABLE dbo.Seller;
IF OBJECT_ID('dbo.Customer','U') IS NOT NULL DROP TABLE dbo.Customer;
IF OBJECT_ID('dbo.User','U') IS NOT NULL DROP TABLE dbo."User"


CREATE TABLE "User" (
  User_ID        int  PRIMARY KEY,
  Username      VARCHAR(100) NOT NULL,
  Password  VARCHAR(500) NOT NULL,
  Email         VARCHAR(150),
  Phone         VARCHAR(20),
  Role          VARCHAR(20) NOT NULL  -- 'Customer','Seller','Admin'
);

CREATE TABLE Customer (
  Customer_ID int primary key ,
  User_ID      int,
  Address     VARCHAR(500),
  ShippingPreferences VARCHAR(500),
  FOREIGN KEY (User_ID) REFERENCES "User"(User_ID)

);

CREATE TABLE Seller (
  Seller_ID int primary key,
  User_ID     INT ,
  StoreName  VARCHAR(150),
  BankAccount VARCHAR(64),
  Rating     DECIMAL(3,2),
  FOREIGN KEY (User_ID) REFERENCES "User"(User_ID)

);

CREATE TABLE Admin (
  Admin_ID int primary key,
  User_ID   INT ,
  Position VARCHAR(100),
  FOREIGN KEY (User_ID) REFERENCES "User"(User_ID)
);

CREATE TABLE Category (
  Category_ID int PRIMARY KEY,
  CategoryName VARCHAR(100) NOT NULL,
  Description TEXT
);

CREATE TABLE Product (
  Product_ID   int primary key ,
  Seller_ID    INT ,
  Category_ID  INT ,
  Name        VARCHAR(200),
  Description varchar(55),
  Price       DECIMAL(10,2),
  Stock       INT,
  SKU         VARCHAR(64),
  CreatedAt   varchar(55),
  FOREIGN KEY (Seller_ID) REFERENCES Seller( Seller_ID),
   FOREIGN KEY (Category_ID) REFERENCES Category( Category_ID)

);

CREATE TABLE Cart (
  Cart_ID      int PRIMARY KEY,
  Customer_ID int,
   FOREIGN KEY (Customer_ID) REFERENCES Customer( Customer_ID)
);

CREATE TABLE Cart_Item (
  CartItem_ID  int PRIMARY KEY,
  Cart_ID      INT,
  Product_ID   INT ,
  Quantity    INT,
   FOREIGN KEY (Cart_ID) REFERENCES Cart( Cart_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product( Product_ID)
);

CREATE TABLE "Order" (
  Order_ID       int PRIMARY KEY,
  Customer_ID    INT ,
  OrderDate     varchar(55),
  Status        VARCHAR(50), -- e.g., 'Pending','Shipped','Delivered','Cancelled'
  TotalAmount   DECIMAL(12,2),
  ShippingAddress VARCHAR(255),
   FOREIGN KEY (Customer_ID) REFERENCES Customer( Customer_ID)
);

CREATE TABLE Order_Item (
  OrderItem_ID    int PRIMARY KEY,
  Order_ID        INT ,
  Product_ID      INT ,
  Quantity       INT,
  PriceAtPurchase DECIMAL(10,2),
   FOREIGN KEY (Order_ID) REFERENCES "Order"( Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product( Product_ID)
);

CREATE TABLE Payment (
  Payment_ID     int PRIMARY KEY,
  Order_ID       INT ,
  PaymentMethod VARCHAR(50),
  PaymentStatus VARCHAR(50), -- 'Pending','Completed','Failed','Refunded'
  PaymentDate   DATETIME,
  AmountPaid    DECIMAL(12,2),
   FOREIGN KEY (Order_ID) REFERENCES "Order"( Order_ID)
);

CREATE TABLE Review (
  Review_ID     int PRIMARY KEY,
  Customer_ID   INT ,
  Product_ID    INT ,
  Rating       INT, -- 1..5
  Comment      varchar(55),
  ReviewDate   varchar(55)
);

CREATE TABLE Discount (
  Discount_ID   int PRIMARY KEY,
  Product_ID    INT ,
  DiscountName VARCHAR(150),
  Type         VARCHAR(20), -- 'Percentage' or 'Fixed'
  Value        DECIMAL(10,2),
  StartDate    DATE,
  EndDate      DATE,
  FOREIGN KEY (Product_ID) REFERENCES Product( Product_ID)
);

CREATE TABLE Complaint (
  Complaint_ID   int PRIMARY KEY,
  Customer_ID    INT ,
  Admin_ID       INT ,
  Description   TEXT,
  DateSubmitted varchar(55),
  Status        VARCHAR(50) -- 'Open','InProgress','Resolved','Rejected',
   FOREIGN KEY (Customer_ID) REFERENCES Customer( Customer_ID),
    FOREIGN KEY (Admin_ID) REFERENCES Admin( Admin_ID)
);
SELECT * FROM "User"
ORDER BY Username ASC;


UPDATE "User"
SET Email = 'newhabiba@gmail.com'
WHERE User_ID = 1;

DELETE FROM "User"
WHERE User_ID = 2;

SELECT * 
FROM "User"
WHERE Email LIKE '%@gmail.com';

SELECT * 
FROM "User"
WHERE Username LIKE '______';





INSERT INTO "User" (User_ID, Username, Password, Email, Phone, Role) VALUES
(1, 'habiba', 'pass123', 'habiba@gmail.com', '0100000001', 'Customer'),
(2, 'mohamed', 'pass456', 'mohamed@gmail.com', '0100000002', 'Customer'),
(3, 'seller_store1', 'sell111', 'store1@gmail.com', '0100000003', 'Seller'),
(4, 'seller_store2', 'sell222', 'store2@gmail.com', '0100000004', 'Seller'),
(5, 'admin01', 'admin999', 'admin01@gmail.com', '0100000005', 'Admin'),
(6, 'ahmed', 'pass789', 'ahmed@gmail.com', '0100000006', 'Customer'),
(7, 'admin03', 'admin9', 'admin0331@gmail.com', '01003000005', 'Admin'),
(8, 'admin04', 'admin94', 'admin0331@gmail.com', '01004000005', 'Admin'),
(9, 'admin05', 'admin939', 'admin031@gmail.com', '010004500005', 'Admin'),
(10, 'admin06', 'admin911', 'admin010@gmail.com', '01000050005', 'Admin');
SELECT * FROM "User";

INSERT INTO "User" (User_ID, Username, Password, Email, Phone, Role)
VALUES

(11, 'seller01', 'sell101', 'seller1@shop.com', '0120000011', 'Seller'),
(12, 'seller02', 'sell102', 'seller2@shop.com', '0120000012', 'Seller'),
(13, 'seller03', 'sell103', 'seller3@shop.com', '0120000013', 'Seller'),
(14, 'seller04', 'sell104', 'seller4@shop.com', '0120000014', 'Seller'),
(15, 'seller05', 'sell105', 'seller5@shop.com', '0120000015', 'Seller'),
(16, 'seller06', 'sell106', 'seller6@shop.com', '0120000016', 'Seller'),
(17, 'seller07', 'sell107', 'seller7@shop.com', '0120000017', 'Seller'),
(18, 'seller08', 'sell108', 'seller8@shop.com', '0120000018', 'Seller'),
(19, 'seller09', 'sell109', 'seller9@shop.com', '0120000019', 'Seller'),
(20, 'seller10', 'sell110', 'seller10@shop.com', '0120000020', 'Seller'),
(21, 'manager1', 'admin201', 'mgr1@sys.com', '0150000021', 'Admin'),
(22, 'manager2', 'admin202', 'mgr2@sys.com', '0150000022', 'Admin'),
(23, 'manager3', 'admin203', 'mgr3@sys.com', '0150000023', 'Admin'),
(24, 'manager4', 'admin204', 'mgr4@sys.com', '0150000024', 'Admin'),
(25, 'manager5', 'admin205', 'mgr5@sys.com', '0150000025', 'Admin'),
(26, 'support1', 'admin206', 'sup1@sys.com', '0150000026', 'Admin'),
(27, 'support2', 'admin207', 'sup2@sys.com', '0150000027', 'Admin'),
(28, 'hr_user1', 'admin208', 'hr1@sys.com', '0150000028', 'Admin'),
(29, 'hr_user2', 'admin209', 'hr2@sys.com', '0150000029', 'Admin'),
(30, 'it_head', 'admin210', 'it@sys.com', '0150000030', 'Admin');
INSERT INTO Customer (Customer_ID, User_ID, Address, ShippingPreferences)VALUES
(1, 1, '15 Tahrir St, Cairo, Egypt', 'Standard Shipping'),
(2, 2, '22 Corniche Rd, Alexandria, Egypt', 'Express Delivery'),
(3, 3, '10 El-Bahr St, Tanta, Egypt', 'Standard Shipping'),
(4, 4, '5 Dokki St, Giza, Egypt', 'Pickup from Store'),
(5, 5, '33 Ramses St, Cairo, Egypt', 'Express Delivery'),
(6, 6, '12 Zamalek St, Cairo, Egypt', 'Standard Shipping'),
(7, 7, '8 Gomhouria St, Assiut, Egypt', 'Call before delivery'),
(8, 8, '90 St, New Cairo, Egypt', 'Express Delivery'),
(9, 9, '45 Haram St, Giza, Egypt', 'Standard Shipping'),
(10, 10, '7 Maadi Rd, Cairo, Egypt', 'Weekend Delivery Only');
SELECT * FROM Customer;





SELECT * FROM Customer
ORDER BY Address DESC;

SELECT * FROM Customer WHERE Address LIKE '%Giza%';

SELECT * 
FROM Customer
WHERE Address LIKE '%Alexandria%';

UPDATE Customer
SET ShippingPreferences = 'Express Delivery'
WHERE Customer_ID = 1;

DELETE FROM Customer
WHERE Customer_ID = 2;

INSERT INTO Seller (Seller_ID, User_ID, StoreName, BankAccount, Rating)
VALUES
(1, 11, 'Cairo Tech Store', 'EG123456789', 4.5),
(2, 12, 'Alex Fashion Hub', 'EG987654321', 3.8),
(3, 13, 'Home Decor Plus', 'EG112233445', 4.9),
(4, 14, 'Giza Mobiles', 'EG556677889', 2.5),
(5, 15, 'Smart Gadgets', 'EG998877665', 5.0),
(6, 16, 'Book Worms', 'EG443322110', 4.2),
(7, 17, 'Kids Toys Zone', 'EG665544332', 3.0),
(8, 18, 'Sports Gear', 'EG123123123', 4.7),
(9, 19, 'Beauty Queen', 'EG321321321', 4.1),
(10, 20, 'Auto Parts Pro', 'EG777888999', 3.9);

SELECT * FROM Seller;

SELECT * FROM Seller
ORDER BY Rating DESC;

SELECT * FROM Seller WHERE Rating >= 4.5;

SELECT * 
FROM Seller
WHERE BankAccount LIKE '%__';

SELECT * 
FROM Seller
WHERE StoreName LIKE '%Hub';

UPDATE Seller
SET Rating = 4.8
WHERE Seller_ID = 3;

DELETE FROM Seller
WHERE Seller_ID = 4;


INSERT INTO Admin (Admin_ID, User_ID, Position) VALUES
(1, 21, 'General Manager'),
(2, 22, 'Database Administrator'),
(3, 23, 'System Analyst'),
(4, 24, 'Security Officer'),
(5, 25, 'Content Moderator'),
(6, 26, 'Customer Support Lead'),
(7, 27, 'Sales Manager'),
(8, 28, 'HR Specialist'),
(9, 29, 'Marketing Head'),
(10, 30, 'IT Director');

SELECT * FROM Admin;

SELECT * FROM Admin
ORDER BY Position ASC;

SELECT * FROM Admin WHERE Position = 'Support Manager';

UPDATE Admin
SET Position = 'Operations Manager'
WHERE Admin_ID = 5;

DELETE FROM Admin
WHERE Admin_ID = 5;

INSERT INTO Category (Category_ID, CategoryName, Description)
VALUES
(1, 'Electronics', 'Phones, Laptops and gadgets'),
(2, 'Fashion', 'Men and Women clothing'),
(3, 'Home & Kitchen', 'Furniture and cooking tools'),
(4, 'Books', 'Educational and fictional books'),
(5, 'Toys', 'Games for kids and puzzles'),
(6, 'Sports', 'Sporting equipment and wear'),
(7, 'Beauty', 'Makeup and skincare products'),
(8, 'Automotive', 'Car parts and accessories'),
(9, 'Gaming', 'Consoles and video games'),
(10, 'Groceries', 'Daily food and essentials');
SELECT * FROM Category;

SELECT * FROM Category
ORDER BY CategoryName ASC;

SELECT * FROM Category WHERE CategoryName = 'Mobiles';

UPDATE Category
SET Description = 'All electronic gadgets'
WHERE Category_ID = 1;

DELETE FROM Category
WHERE Category_ID = 2;



INSERT INTO Product (Product_ID, Seller_ID, Category_ID, Name, Description, Price, Stock, SKU, CreatedAt)
VALUES
(1, 1, 1, 'Dell XPS 15', 'High performance laptop', 35000.00, 5, 'SKU-1001', '2023-11-01'),
(2, 2, 2, 'Leather Jacket', 'Black leather jacket', 1200.00, 20, 'SKU-1002', '2023-11-02'),
(3, 3, 3, 'Coffee Maker', 'Automatic coffee machine', 4500.00, 10, 'SKU-1003', '2023-11-03'),
(4, 4, 4, 'Harry Potter', 'Fantasy novel series', 500.00, 100, 'SKU-1004', '2023-11-04'),
(5, 5, 5, 'Lego Set', 'Building blocks kit', 800.00, 30, 'SKU-1005', '2023-11-05'),
(6, 6, 6, 'Yoga Mat', 'Non-slip exercise mat', 300.00, 50, 'SKU-1006', '2023-11-06'),
(7, 7, 7, 'Face Cream', 'Moisturizing cream', 250.00, 40, 'SKU-1007', '2023-11-07'),
(8, 8, 8, 'Car Vacuum', 'Portable car cleaner', 600.00, 15, 'SKU-1008', '2023-11-08'),
(9, 9, 9, 'PlayStation 5', 'Gaming console', 28000.00, 8, 'SKU-1009', '2023-11-09'),
(10, 10, 10, 'Olive Oil', 'Extra virgin oil 1L', 350.00, 60, 'SKU-1010', '2023-11-10');

SELECT * FROM Product;


SELECT * FROM Product
ORDER BY Price DESC;
SELECT * FROM Product WHERE Price > 1000;
SELECT * 
FROM Product
WHERE SKU LIKE 'PHONE_';
SELECT * 
FROM Product
WHERE Name LIKE 'L%0';
SELECT * 
FROM Product
WHERE Name LIKE '%Pro%' AND Name LIKE '%X%';
SELECT * 
FROM Product
WHERE Name LIKE '%Pro%';
SELECT * 
FROM Product
WHERE Name LIKE 'Smar%';
UPDATE Product
SET Stock = 50
WHERE Product_ID = 2;
DELETE FROM Product
WHERE Product_ID = 4;

INSERT INTO Cart (Cart_ID, Customer_ID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
SELECT * FROM Cart;

SELECT * FROM Cart
ORDER BY Customer_ID ASC;

SELECT * FROM Cart WHERE Customer_ID = 1;

UPDATE Cart
SET Customer_ID = 3
WHERE Cart_ID = 1;

DELETE FROM Cart
WHERE Cart_ID = 2;


DELETE FROM "Cart";

SELECT * FROM Cart_Item
ORDER BY Quantity DESC;

INSERT INTO Cart_Item (CartItem_ID, Cart_ID, Product_ID, Quantity)
VALUES
(1, 1, 1, 1),  
(2, 1, 2, 2),  
(3, 2, 5, 1),  
(4, 3, 10, 5),  
(5, 4, 9, 1),   
(6, 5, 4, 1),  
(7, 6, 7, 3),   
(8, 7, 8, 1),   
(9, 8, 3, 1),   
(10, 9, 6, 2); 
SELECT * FROM Cart_Item;

SELECT * FROM Cart_Item WHERE Quantity > 1;


UPDATE Cart_Item
SET Quantity = 3
WHERE CartItem_ID = 2;


DELETE FROM Cart_Item
WHERE CartItem_ID = 3

INSERT INTO "Order" (Order_ID, Customer_ID, OrderDate, Status, TotalAmount, ShippingAddress)
VALUES
(1, 1, '2023-11-15', 'Delivered', 35000.00, '15 Tahrir St, Cairo'),
(2, 2, '2023-11-16', 'Shipped', 1200.00, '22 Corniche Rd, Alex'),
(3, 3, '2023-11-17', 'Pending', 4500.00, '10 El-Bahr St, Tanta'),
(4, 4, '2023-11-18', 'Delivered', 500.00, '5 Dokki St, Giza'),
(5, 5, '2023-11-19', 'Cancelled', 800.00, '33 Ramses St, Cairo'),
(6, 6, '2023-11-20', 'Shipped', 900.00, '12 Zamalek St, Cairo'),
(7, 7, '2023-11-21', 'Processing', 250.00, '8 Assiut City'),
(8, 8, '2023-11-22', 'Delivered', 600.00, '90 St, New Cairo'),
(9, 9, '2023-11-23', 'Pending', 28000.00, '45 Haram St, Giza'),
(10, 10, '2023-11-24', 'Delivered', 350.00, '7 Maadi Rd, Cairo');


SELECT * FROM "Order";



SELECT * FROM "Order"
ORDER BY TotalAmount DESC;

SELECT * FROM "Order" WHERE Status = 'Pending';
 
UPDATE "Order"
SET Status = 'Shipped'
WHERE Order_ID = 2;

DELETE FROM "Order"
WHERE Order_ID = 2;

INSERT INTO Order_Item (OrderItem_ID, Order_ID, Product_ID, Quantity, PriceAtPurchase)
VALUES
(1, 1, 1, 1, 35000.00),   
(2, 2, 2, 1, 1200.00),   
(3, 3, 3, 1, 4500.00),   
(4, 4, 4, 1, 500.00),     
(5, 5, 5, 1, 800.00),     
(6, 6, 6, 3, 300.00),     
(7, 7, 7, 1, 250.00),   
(8, 8, 8, 1, 600.00),     
(9, 9, 9, 1, 28000.00),   
(10, 10, 10, 1, 350.00);  
SELECT * FROM Order_Item;


SELECT * FROM Order_Item
ORDER BY Quantity DESC;

SELECT * FROM Order_Item WHERE PriceAtPurchase >= 1200;

UPDATE Order_Item
SET PriceAtPurchase = PriceAtPurchase+550
WHERE OrderItem_ID = 1;

DELETE FROM Order_Item
WHERE OrderItem_ID = 3;

INSERT INTO Payment (Payment_ID, Order_ID, PaymentMethod, PaymentStatus, PaymentDate, AmountPaid)
VALUES
(1, 1, 'Credit Card', 'Completed', '2023-11-15 10:00:00', 35000.00),
(2, 2, 'Cash on Delivery', 'Completed', '2023-11-16 12:30:00', 1200.00),
(3, 3, 'Visa', 'Pending', '2023-11-17 09:15:00', 4500.00),
(4, 4, 'Credit Card', 'Completed', '2023-11-18 14:00:00', 500.00),
(5, 5, 'PayPal', 'Refunded', '2023-11-19 11:00:00', 800.00),
(6, 6, 'Credit Card', 'Completed', '2023-11-20 16:45:00', 900.00),
(7, 7, 'Cash on Delivery', 'Pending', '2023-11-21 13:20:00', 250.00),
(8, 8, 'Visa', 'Completed', '2023-11-22 10:10:00', 600.00),
(9, 9, 'Credit Card', 'Pending', '2023-11-23 08:00:00', 28000.00),
(10, 10, 'Cash on Delivery', 'Completed', '2023-11-24 19:30:00', 350.00);

SELECT * FROM Payment;
SELECT * FROM Payment
ORDER BY PaymentDate ASC;

SELECT * FROM Payment WHERE PaymentStatus = 'Pending';

UPDATE Payment
SET PaymentStatus = 'Completed', AmountPaid = 350
WHERE Payment_ID = 2;

DELETE FROM Payment
WHERE Payment_ID = 2;
 
 INSERT INTO Review (Review_ID, Customer_ID, Product_ID, Rating, Comment, ReviewDate)
VALUES
(1, 1, 1, 5, 'Excellent laptop, very fast!', '2023-11-20'),
(2, 2, 2, 4, 'Nice jacket but size is small', '2023-11-21'),
(3, 3, 3, 5, 'Best coffee maker ever', '2023-11-22'),
(4, 4, 4, 5, 'Loved the book, great story', '2023-11-23'),
(5, 5, 5, 3, 'Pieces were hard to connect', '2023-11-24'),
(6, 6, 6, 4, 'Good quality mat', '2023-11-25'),
(7, 7, 7, 5, 'Very smooth on skin', '2023-11-26'),
(8, 8, 8, 2, 'Not powerful enough', '2023-11-27'),
(9, 9, 9, 5, 'PS5 is amazing!', '2023-11-28'),
(10, 10, 10, 4, 'Good oil for salads', '2023-11-29');

SELECT * FROM Review;

SELECT * FROM Review
ORDER BY Rating DESC;

SELECT * FROM Review WHERE Rating >= 5;

SELECT * 
FROM Review
WHERE Comment LIKE 'A%' AND LEN(Comment) >= 10;

UPDATE Review
SET Comment = 'Excellent smartphone!'
WHERE Review_ID = 1;

DELETE FROM Review
WHERE Review_ID = 2;

INSERT INTO Discount (Discount_ID, Product_ID, DiscountName, Type, Value, StartDate, EndDate)
VALUES
(1, 1, 'Black Friday Deal', 'Percentage', 15.00, '2023-11-20', '2023-11-30'),
(2, 2, 'Winter Sale', 'Fixed', 200.00, '2023-12-01', '2024-01-01'),
(3, 3, 'New Arrival Promo', 'Percentage', 10.00, '2023-10-01', '2023-10-15'),
(4, 4, 'Book Lovers Day', 'Percentage', 20.00, '2023-11-05', '2023-11-06'),
(5, 5, 'Toy Clearance', 'Percentage', 30.00, '2023-12-15', '2023-12-31'),
(6, 6, 'Healthy Life', 'Fixed', 50.00, '2023-11-01', '2023-11-10'),
(7, 7, 'Beauty Week', 'Percentage', 25.00, '2023-11-10', '2023-11-17'),
(8, 8, 'Car Accessories Deal', 'Percentage', 5.00, '2023-09-01', '2023-09-30'),
(9, 9, 'Gamer Special', 'Fixed', 1000.00, '2023-11-25', '2023-11-28'),
(10, 10, 'Grocery Bundle', 'Percentage', 12.00, '2023-11-01', '2023-11-07');
SELECT * FROM Discount;

SELECT * FROM Discount
ORDER BY Value DESC;

SELECT * FROM Discount WHERE Type = 'Percentage';

UPDATE Discount
SET Value = 15
WHERE Discount_ID = 1;

DELETE FROM Discount
WHERE Discount_ID = 2;

INSERT INTO Complaint (Complaint_ID, Customer_ID, Admin_ID, Description, DateSubmitted, Status)
VALUES
(1, 1, 1, 'Late delivery on my order', '2023-11-01', 'Open'),
(2, 2, 2, 'Received wrong item size', '2023-11-02', 'Resolved'),
(3, 3, 3, 'Product arrived damaged', '2023-11-03', 'InProgress'),
(4, 4, 4, 'Refund request ignored', '2023-11-04', 'Open'),
(5, 5, 5, 'Website login issue', '2023-11-05', 'Resolved'),
(6, 6, 6, 'Coupon code not working', '2023-11-06', 'Rejected'),
(7, 7, 7, 'Driver was rude', '2023-11-07', 'InProgress'),
(8, 8, 8, 'Charged twice for order', '2023-11-08', 'Resolved'),
(9, 9, 9, 'Missing parts in package', '2023-11-09', 'Open'),
(10, 10, 10, 'Order cancelled without reason', '2023-11-10', 'Resolved');
SELECT * FROM Complaint;

SELECT * FROM Complaint
ORDER BY DateSubmitted DESC;

SELECT Customer_ID, Status
FROM Complaint
WHERE Customer_ID = 3;

UPDATE Complaint
SET Status = 'Resolved'
WHERE Complaint_ID = 2;

DELETE FROM Complaint
WHERE Complaint_ID = 1;

SELECT COUNT(*) AS TotalCustomers FROM Customer;

SELECT SUM(TotalAmount) AS TotalSales FROM "Order";

SELECT AVG(Rating) AS AvgRating FROM Review;
 
SELECT MAX(Price) AS HighestPrice FROM Product;

SELECT MIN(Stock) AS LowestStock FROM Product;

SELECT 
    Customer.Customer_ID,
    Customer.User_ID,
    "User".Username,
    "User".Email,
    Customer.Address
FROM Customer
INNER JOIN "User"
    ON Customer.User_ID = "User".User_ID;


    SELECT 
    Product.Product_ID,
    Product.Name AS ProductName,
    Category.CategoryName,
    Category.Category_ID
FROM Product
LEFT JOIN Category
    ON Product.Category_ID = Category.Category_ID;

    SELECT 
    Seller.Seller_ID,
    Seller.StoreName,
    Product.Product_ID,
    Product.Name AS ProductName
FROM Product
RIGHT JOIN Seller
    ON Product.Seller_ID = Seller.Seller_ID;

    SELECT 
    Customer.Customer_ID,
    Customer.Address,
    "Order".Order_ID,
    "Order".TotalAmount
FROM Customer
FULL OUTER JOIN "Order"
    ON Customer.Customer_ID = "Order".Customer_ID



DELETE FROM Payment;
DELETE FROM Order_Item;
DELETE FROM Cart_Item;
DELETE FROM Complaint;  
DELETE FROM Discount;   
DELETE FROM "Order";
DELETE FROM Cart;
DELETE FROM Product;
DELETE FROM Category;
DELETE FROM Customer;
DELETE FROM Seller;
DELETE FROM Admin;
DELETE FROM "User";