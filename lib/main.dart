import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List App',
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: "Laptop", price: 899.99),
    Product(name: "Smartwatch", price: 199.99),
    Product(name: "Headphones", price: 149.99),
    Product(name: "Tablet", price: 399.99),
    Product(name: "Camera", price: 599.99),
    Product(name: "Drone", price: 799.99),
    Product(name: "Gaming Console", price: 499.99),
    Product(name: "Fitness Tracker", price: 79.99),
    Product(name: "Bluetooth Speaker", price: 69.99),
    Product(name: "External Hard Drive", price: 129.99),
    Product(name: "Monitor", price: 299.99),
    Product(name: "Mouse and Keyboard Combo", price: 49.99),
  ];

  int cartItemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Product List")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(cartItemCount: cartItemCount),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: ListTile(
              title: Text(
                products[index].name,
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                "\$${products[index].price.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 10),
              ),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Count: ${products[index].counter}',
                    style: TextStyle(fontSize: 10),
                  ),
                  Container(
                    height: 35,
                    width: 60,
                    child: TextButton(
                      onPressed: () {
                        setState(
                              () {
                            products[index].incrementCounter();
                            if (products[index].counter == 5) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Congratulations!"),
                                    content: Text(
                                      "You've bought 5 ${products[index].name}!",
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                            cartItemCount++;
                          },
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        "Buy Now",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  int counter = 0;

  Product({required this.name, required this.price});

  void incrementCounter() {
    counter++;
  }
}

class CartPage extends StatelessWidget {
  final int cartItemCount;

  CartPage({required this.cartItemCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Center(
        child: Text("Total Items in Cart: $cartItemCount"),
      ),
    );
  }
}