/**DROP TABLE kalau sudah ada**/

DROP TABLE IF EXISTS order_items;

DROP TABLE IF EXISTS orders;

DROP TABLE IF EXISTS products;

DROP TABLE IF EXISTS customers;

DROP TABLE IF EXISTS categories;

-- TABLE categories (kategori produk)

CREATE TABLE categories (

    category_id INT AUTO_INCREMENT PRIMARY KEY,

    category_name VARCHAR(100) NOT NULL

);

-- TABLE products (daftar produk)

CREATE TABLE products (

    product_id INT AUTO_INCREMENT PRIMARY KEY,

    product_name VARCHAR(255) NOT NULL,

    category_id INT,

    price DECIMAL(10,0) NOT NULL,

    stock INT DEFAULT 0 NOT NULL,

    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE SET NULL

);

-- TABLE customers (pelanggan)

CREATE TABLE customers (

    customer_id INT AUTO_INCREMENT PRIMARY KEY,

    full_name VARCHAR(255) NOT NULL,

    email VARCHAR(255) UNIQUE,

    country VARCHAR(100),

    join_date DATE

);

-- TABLE orders (transaksi penjualan)

CREATE TABLE orders (

    order_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT,

    order_date DATE,

    total_amount DECIMAL(10,0),

    status ENUM('pending','shipped','delivered','cancelled') DEFAULT 'pending',

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE

);

-- TABLE order_items (detail tiap produk yang dibeli)

CREATE TABLE order_items (

    order_item_id INT AUTO_INCREMENT PRIMARY KEY,

    order_id INT,

    product_id INT,

    quantity INT NOT NULL,

    subtotal DECIMAL(10,0),

    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,

    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE

);

-- inserting data

INSERT INTO categories (category_name)
VALUES 
('Electronics'),
('Clothing'),
('Books'),
('Home & Kitchen'),
('Beauty'),
('Sports'),
('Toys');

INSERT INTO products (product_name, category_id, price, stock)
VALUES
('Smartphone X', 1, 7500000, 20),
('Laptop Air 14', 1, 12000000, 10),
('Wireless Earbuds', 1, 800000, 30),
('T-Shirt Unisex', 2, 150000, 100),
('Jeans Slim Fit', 2, 250000, 80),
('Novel Romance', 3, 95000, 50),
('Cookbook Recipes', 3, 120000, 40),
('Air Fryer', 4, 1300000, 15),
('Blender Pro', 4, 950000, 25),
('Face Serum', 5, 200000, 60),
('Moisturizer Cream', 5, 180000, 55),
('Yoga Mat', 6, 300000, 30),
('Dumbbell Set', 6, 450000, 25),
('Action Figure', 7, 350000, 40),
('Board Game', 7, 250000, 35),
('Smartwatch Z', 1, 2500000, 20),
('Gaming Mouse', 1, 600000, 30),
('Sweatshirt Hoodie', 2, 280000, 50),
('Hair Dryer', 5, 400000, 40),
('Fiction Novel', 3, 110000, 45);



INSERT INTO customers (full_name, email, country, join_date)
VALUES
('Rara Intani', 'rara.intani@gmail.com', 'Indonesia', '2024-05-12'),
('Budi Santoso', 'budi.santoso@gmail.com', 'Indonesia', '2024-06-20'),
('Siti Rahma', 'siti.rahma@gmail.com', 'Malaysia', '2024-07-15'),
('John Tan', 'john.tan@gmail.com', 'Singapore', '2024-08-01'),
('Aiko Suzuki', 'aiko.suzuki@gmail.com', 'Japan', '2024-09-03'),
('Andi Wijaya', 'andi.wijaya@gmail.com', 'Indonesia', '2024-09-12'),
('Maria Lopez', 'maria.lopez@gmail.com', 'Philippines', '2024-09-15'),
('Dewi Anggraini', 'dewi.anggraini@gmail.com', 'Indonesia', '2024-09-18'),
('Chen Wei', 'chen.wei@gmail.com', 'China', '2024-09-21'),
('Nguyen Anh', 'nguyen.anh@gmail.com', 'Vietnam', '2024-09-23'),
('Putri Lestari', 'putri.lestari@gmail.com', 'Indonesia', '2024-10-01'),
('Rafi Maulana', 'rafi.maulana@gmail.com', 'Indonesia', '2024-10-03'),
('Linda Hartono', 'linda.hartono@gmail.com', 'Indonesia', '2024-10-05'),
('Aditya Nugroho', 'aditya.nugroho@gmail.com', 'Indonesia', '2024-10-07'),
('Nina Park', 'nina.park@gmail.com', 'Korea', '2024-10-10'),
('Eka Saputra', 'eka.saputra@gmail.com', 'Indonesia', '2024-10-12'),
('Sari Wulandari', 'sari.wulandari@gmail.com', 'Indonesia', '2024-10-15'),
('Ahmad Fauzan', 'ahmad.fauzan@gmail.com', 'Indonesia', '2024-10-18'),
('Takeshi Ito', 'takeshi.ito@gmail.com', 'Japan', '2024-10-21'),
('Hana Kim', 'hana.kim@gmail.com', 'Korea', '2024-10-25');


INSERT INTO orders (customer_id, order_date, total_amount, status)
VALUES
(1, '2024-10-01', 8300000, 'delivered'),
(2, '2024-10-02', 150000, 'delivered'),
(3, '2024-10-03', 95000, 'pending'),
(4, '2024-10-04', 1300000, 'shipped'),
(5, '2024-10-05', 12000000, 'cancelled'),
(6, '2024-10-06', 450000, 'delivered'),
(7, '2024-10-07', 400000, 'pending'),
(8, '2024-10-08', 280000, 'shipped'),
(9, '2024-10-09', 950000, 'delivered'),
(10, '2024-10-10', 600000, 'delivered'),
(11, '2024-10-11', 110000, 'pending'),
(12, '2024-10-12', 7750000, 'delivered'),
(13, '2024-10-13', 350000, 'shipped'),
(14, '2024-10-14', 180000, 'delivered'),
(15, '2024-10-15', 2500000, 'delivered'),
(16, '2024-10-16', 800000, 'delivered'),
(17, '2024-10-17', 250000, 'pending'),
(18, '2024-10-18', 200000, 'delivered'),
(19, '2024-10-19', 450000, 'delivered'),
(20, '2024-10-20', 1300000, 'shipped'),
(3, '2024-10-21', 600000, 'delivered'),
(8, '2024-10-22', 280000, 'delivered'),
(2, '2024-10-23', 250000, 'pending'),
(9, '2024-10-24', 1300000, 'delivered'),
(1, '2024-10-25', 200000, 'delivered');



INSERT INTO order_items (order_id, product_id, quantity, subtotal)
VALUES
(1, 1, 1, 7500000),
(1, 3, 1, 800000),
(2, 4, 1, 150000),
(3, 6, 1, 95000),
(4, 8, 1, 1300000),
(5, 2, 1, 12000000),
(6, 13, 1, 450000),
(7, 19, 1, 400000),
(8, 18, 1, 280000),
(9, 9, 1, 950000),
(10, 17, 1, 600000),
(11, 20, 1, 110000),
(12, 1, 1, 7500000),
(13, 14, 1, 350000),
(14, 11, 1, 180000),
(15, 16, 1, 2500000),
(16, 3, 1, 800000),
(17, 5, 1, 250000),
(18, 10, 1, 200000),
(19, 12, 1, 450000),
(20, 8, 1, 1300000),
(21, 17, 1, 600000),
(22, 18, 1, 280000),
(23, 4, 1, 250000),
(24, 8, 1, 1300000),
(25, 10, 1, 200000);
