import 'dart:io';

void main() {
  // Product List
  List<Product> products = [
    USB("USB Drive", 10, 500),
    iPhone("iPhone 12", 5, 100000),
    TShirt("T-Shirt", 20, 1200),
  ];

  // Cart List
  List<Product> cart = [];

  while (true) {
    print("\n===== Main Menu =====");
    int i = 0;
    for (var product in products) {
      print(
        "Press ${++i} to select ${product.name} (Stock: ${product.stockQuantity}, Price: ${product.price} Rs)",
      );
    }
    print("Press 0 to Checkout");

    // User Input for Product Selection
    stdout.write("Select a product: ");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 0) {
      break;
    } else if (choice > 0 && choice <= products.length) {
      Product selectedProduct = products[choice - 1];
      stdout.write("Enter quantity: ");
      int qty = int.parse(stdin.readLineSync()!);

      if (qty <= selectedProduct.stockQuantity) {
        cart.add(selectedProduct);
        print("${qty} X ${selectedProduct.name} added to cart!");
      } else {
        print("Not enough stock available!");
      }
    } else {
      print("Invalid selection!");
    }
  }

  // Checkout Process
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
      print("1 X ${item.name} : Total ${item.price} Rs");
    }
    print("=====\nTotal Amount : ${totalAmount} Rs");
    print("Thank you for your order! Mr. , $name!");
    print("Your Contact: , $phone!");
    print("Your Email: , $email!");
    cart.clear();
  } else {
    print("Cart is empty. No order placed.");
  }
}

// Abstract Product Class
abstract class Product {
  String name;
  int stockQuantity;
  double price;

  Product(this.name, this.stockQuantity, this.price);
}

// Mixin for Storage Option
mixin StorageOption {
  List<String> get storageOptions;
}

// USB Class with Storage Option
class USB extends Product with StorageOption {
  @override
  List<String> get storageOptions => ["16GB", "32GB"];

  USB(String name, int stockQuantity, double price)
    : super(name, stockQuantity, price);
}

// iPhone Class with Storage Option
class iPhone extends Product with StorageOption {
  @override
  List<String> get storageOptions => ["128GB", "256GB"];

  iPhone(String name, int stockQuantity, double price)
    : super(name, stockQuantity, price);
}

// TShirt Class (Simple Product)
class TShirt extends Product {
  TShirt(String name, int stockQuantity, double price)
    : super(name, stockQuantity, price);
}
