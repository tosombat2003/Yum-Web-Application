# 🥗Yum Aeb Zaap  (ยำแอบแซ่บ) - Web application

> A full-stack e-commerce web application simulating an online ordering system for a Thai salad restaurant (yum) — built as a paired project for a Web Applications Development course.

---

## 📖 About

Yum Aeb Zaap - Web application is a restaurant ordering system that lets customers browse the menu, build an order with multiple items, customize each dish, and complete a payment — all in one session. On the backend, an admin panel gives the shop owner full control over the menu, incoming orders, and order history.

---

## ✨ Features

**Customer**
- 🛒 **Multi-item ordering** — add multiple menu items in a single order
- 🌶️ **Item customization** — choose toppings and portion details for each dish
- 🧾 **Cart & checkout** — review selected items and proceed to payment

**Admin**
- ➕ **Menu management** — add, edit, and remove menu items
- 📋 **Order management** — receive and manage incoming orders
- 📜 **Order history** — view past orders and bills

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Frontend | HTML, CSS |
| Backend | PHP |
| Database | MySQL |

---

## ⚙️ Installation

1. Clone the repository
   ```bash
   git clone https://github.com/YOUR_USERNAME/web-yam.git
   cd yum-web-application
   ```
2. Set up a local server — recommended: [XAMPP](https://www.apachefriends.org/) or [MAMP](https://www.mamp.info/)
3. Move the project folder to your server's root directory (e.g. `htdocs` for XAMPP)
4. Import the database
   - Open **phpMyAdmin**
   - Create a new database (e.g. `yum`)
   - Import the provided `.sql` file
5. Update database credentials in the config file
   ```php
   // connect/connection.php
   $host = 'localhost';
   $db   = 'yum';
   $user = 'root';
   $pass = '';
   ```
6. Open your browser and go to `http://localhost/web-yam`

---

## 👥 Contributors

| Name | Role |
|---|---|
| Suchawadee Tosombat | Developer |
| Panpradap Boontan | Developer |

---

## 💻 Website Previews
* **Customer View:** : https://yum.lovestoblog.com/home.html <br>
* **Admin Dashboard:** : https://yum.lovestoblog.com/admin.php <br>
