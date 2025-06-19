import 'package:flutter/material.dart';
import 'package:grocrey_app/core/model/product_item.dart';

class CartScreen extends StatelessWidget {
  final Map<Fruits, int> cartItem;

  const CartScreen({super.key, required this.cartItem});

  double getTotalPrice() {
    double total = 0;
    cartItem.forEach((fruit, quantity) {
      total += (fruit.price ?? 0) * quantity;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("عربة التسوق")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: 50,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: cartItem.length,
                itemBuilder: (context, index) {
                  final fruit = cartItem.keys.elementAt(index);
                  final count = cartItem[fruit]!;
                  final price = fruit.price ?? 0;
                  final total = count * price;

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              fruit.imageOfFruit!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          fruit.nameOfFruit!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "\$${price.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          "You ordered: $count items\n"
                          "Total: \$${total.toStringAsFixed(2)}",
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color(0xff0CA201)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  // Action on checkout
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("تم تنفيذ الطلب!")),
                  );
                },
                child: Text(
                  "Total: \$${getTotalPrice().toStringAsFixed(2)} | Checkout",
                  style: const TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
