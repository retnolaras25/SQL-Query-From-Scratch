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
