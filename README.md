# 🛒 E-Commerce App in Dart

## 📌 Overview
This is a simple **E-Commerce App** built using **Dart** and **Object-Oriented Programming (OOP)** principles. The app allows users to:
1. **View Available Products** (USB, iPhone, T-Shirt).
2. **Add Products to the Cart** (with stock validation).
3. **Proceed to Checkout** (enter name, phone, email & get order summary).

---

## 🏗️ OOP Concepts Used
✅ **Classes & Objects** – To represent products.  
✅ **Inheritance** – To create different product types from a base class.  
✅ **Mixins** – To add extra features (e.g., Storage Options).  
✅ **Lists & Loops** – To display and store products.  
✅ **User Input Handling** – To allow interaction.  

---

## 🚀 Code Breakdown

### **1️⃣ Base `Product` Class**
This is an **abstract class** that acts as a **blueprint** for all products.
```dart
abstract class Product {
  String name;
  int stockQuantity;
  double price;

  Product(this.name, this.stockQuantity, this.price);
}
```

---

### **2️⃣ Mixin for Storage Option**
A **mixin** is used to add extra functionality to specific product types.
```dart
mixin StorageOption {
  List<String> get storageOptions;
}
```

---

### **3️⃣ Product Classes**
We create **specific products** (`USB`, `iPhone`, `TShirt`) using **inheritance** and **mixins**.

#### **USB Class**
```dart
class USB extends Product with StorageOption {
  @override
  List<String> get storageOptions => ["16GB", "32GB"];

  USB(String name, int stockQuantity, double price) : super(name, stockQuantity, price);
}
```

#### **iPhone Class**
```dart
class iPhone extends Product with StorageOption {
  @override
  List<String> get storageOptions => ["128GB", "256GB"];

  iPhone(String name, int stockQuantity, double price) : super(name, stockQuantity, price);
}
```

#### **TShirt Class**
```dart
class TShirt extends Product {
  TShirt(String name, int stockQuantity, double price) : super(name, stockQuantity, price);
}
```

---

### **4️⃣ Main Menu & Cart System**
This part lets the user **view products, select items, and add them to the cart**.
```dart
List<Product> products = [
  USB("USB Drive", 10, 500),
  iPhone("iPhone 12", 5, 100000),
  TShirt("T-Shirt", 20, 1200)
];

List<Product> cart = [];

while (true) {
  print("\n===== Main Menu =====");
  int i = 0;
  for (var product in products) {
    print("Press \${++i} to select \${product.name} (Stock: \${product.stockQuantity}, Price: \${product.price} Rs)");
  }
  print("Press 0 to Checkout");

  stdout.write("Select a product: ");
  int choice = int.parse(stdin.readLineSync()!);
```

#### **Product Selection & Quantity Input**
```dart
  if (choice == 0) {
    break;
  } else if (choice > 0 && choice <= products.length) {
    Product selectedProduct = products[choice - 1];
    stdout.write("Enter quantity: ");
    int qty = int.parse(stdin.readLineSync()!);

    if (qty <= selectedProduct.stockQuantity) {
      cart.add(selectedProduct);
      print("\${qty} X \${selectedProduct.name} added to cart!");
    } else {
      print("Not enough stock available!");
    }
  } else {
    print("Invalid selection!");
  }
}
```

---

### **5️⃣ Checkout Process**
Once the user selects **checkout**, we take user details and **display the order summary**.
```dart
if (cart.isNotEmpty) {
  stdout.write("Enter your name: ");
  String name = stdin.readLineSync()!;
  stdout.write("Enter phone number: ");
  String phone = stdin.readLineSync()!;
  stdout.write("Enter email: ");
  String email = stdin.readLineSync()!;

  double totalAmount = 0;
  print("\n==== Your Order ==== ");
  for (var item in cart) {
    totalAmount += item.price;
    print("1 X \${item.name} : Total \${item.price} Rs");
  }
  print("=====");
  print("Total Amount : \${totalAmount} Rs");
  print("Thank you for your order, \$name!");
  cart.clear(); // Empty the cart after checkout
} else {
  print("Cart is empty. No order placed.");
}
```

---

## 🎯 Summary
- **Abstract Class (`Product`)**: Defines common properties for all products.
- **Mixins (`StorageOption`)**: Adds extra functionality without inheritance.
- **Inheritance (`USB`, `iPhone`, `TShirt`)**: Specializes products.
- **Lists & Loops**: Display and manage product selection.
- **User Input Handling**: Allows the user to interact with the system.

---

## 🎯 Try Modifying the Code!
Want to create a **bookstore or grocery app**? Try modifying:
1. **Add new product categories (e.g., Books, Groceries).**
2. **Add Discounts & Offers.**
3. **Enhance UI with colors and formatted text.**

---

## 📚 Best Resources to Learn Flutter & Dart  
Here are some top resources to help you master Flutter and Dart:  

1. 📖 **[Flutter Official Documentation](https://flutter.dev/docs)** – Best for official guides & examples.  
2. 💡 **[Dart Official Documentation](https://dart.dev/guides)** – Learn Dart language fundamentals.  
3. 🎥 **[The Tech Brothers (YouTube)](https://www.youtube.com/@thetechbrotherss/)** – Beginner-friendly tutorials.  
4. 🔥 **[The Tech Idara (YouTube)](https://www.youtube.com/@IshaqueHassan)** – Deep dives into Flutter & Dart.  


🚀 **Happy Coding!** 🚀
