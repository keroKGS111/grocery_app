import 'package:flutter/material.dart';
import 'package:grocrey_app/core/model/product_item.dart';
import 'package:grocrey_app/core/screens/cart_screen.dart';
import 'package:grocrey_app/core/screens/home_screen.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> with AutomaticKeepAliveClientMixin {
  PageController controller = PageController();
  int sellectedIndex = 0;

  // ✅ أنشئ السلة هنا في Root مرة واحدة وشاركها
  Map<Fruits, int> cartItem = {};

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // ✅ أنشئ الشاشات هنا بعد تعريف cartItem
    List<Widget> screens = [
      HomeScreen(
        cartItem: cartItem,
      ), // 👈 لازم تعدل HomeScreen عشان تستقبل cartItem كمان
      CartScreen(cartItem: cartItem),
    ];

    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (v) {
          setState(() {
            sellectedIndex = v;
          });
        },
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 3)],
        ),
        height: 70,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    sellectedIndex = 0;
                    controller.jumpToPage(sellectedIndex);
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.home_filled), Text("Home")],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    sellectedIndex = 1;
                    controller.jumpToPage(sellectedIndex);
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.shopping_cart), Text("Cart")],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
