import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grocrey_app/core/model/product_item.dart';
import 'package:grocrey_app/core/screens/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///
  ///
  ///
  ///
  ///
  ///
  // ال List بتاعت ال Slider اللي بيلف لوحده
  List<CustomCardWidget> cards = [
    CustomCardWidget(
      text: "Up to 30% offer",
      text1: "Enjoy our big offer",
      textBton: 'Shop Now',
      backgroundColor: Color(0xffD7FFD4),
      image1: "assets/images/vegetables1.png",
      right: 10,
      top: 50,
      height: 170,
      width: 150,
    ),
    CustomCardWidget(
      text: "Up to 30% offer",
      text1: "Enjoy our big offer",
      textBton: 'Shop Now',
      backgroundColor: Color(0xff0CA201),
      image1: "assets/images/net.png",
      right: 2,
      top: 35,
      height: 190,
      width: 170,
    ),
    CustomCardWidget(
      text: "Get Same day Deliver",
      text1: "On orders above ",
      textBton: 'Shop Now',
      backgroundColor: Color(0xffFFDB24),
      image1: "assets/images/bag.png",
      right: 10,
      top: 80,
      height: 110,
      width: 170,
    ),
  ];

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  // ال List بتاعت الاقسام
  List<CustomListView> listView = [
    CustomListView(image: "assets/images/fruit.png", text: "Fruit"),
    CustomListView(image: "assets/images/milk_eggs.png", text: "Milk & Eggs"),
    CustomListView(image: "assets/images/Laundry.png", text: "Laundry"),
    CustomListView(image: "assets/images/Beverages.png", text: "Beverages"),
    CustomListView(image: "assets/images/vegetables1.png", text: "Vegetables1"),
  ];

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  // ال List بتاعت الفواكه كلها
  List<Fruits> listFruits = [
    Fruits(
      imageOfFruit: "assets/images/banana.png",
      nameOfFruit: "Banana",
      price: 3.99,
    ),
    Fruits(
      imageOfFruit: "assets/images/Pepper.png",
      nameOfFruit: "Papper",
      price: 4.66,
    ),
    Fruits(
      imageOfFruit: "assets/images/Orange.png",
      nameOfFruit: "Orange",
      price: 3.88,
    ),
    Fruits(
      imageOfFruit: "assets/images/Lenmond.png",
      nameOfFruit: "Lemonada",
      price: 2.43,
    ),
  ];

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  // ال Map  الفاضية اللي نوعها Fruits بتاع ال Model ومن نوع int علشان كل item من ال  Fruits  ( KEY ) وال int هو ال ( Value )
  Map<Fruits, int> cartItem = {};

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  // ال Method اللي لما المستخدم يوزد واحد يزود عدد ال Fruits في ال Map ( Cart item )
  void addToCart(Fruits product) {
    setState(() {
      if (cartItem.containsKey(product)) {
        cartItem[product] = cartItem[product]! + 1;
      } else {
        cartItem[product] = 1;
      }
    });
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  //
  void removeFromCart(Fruits product) {
    setState(() {
      if (cartItem.containsKey(product)) {
        if (cartItem[product]! > 1) {
          cartItem[product] = cartItem[product]! - 1;
        } else {
          cartItem.remove(product);
        }
      }
    });
  }

  Future<T?> modelBottonSheet<T>() {
    return showModalBottomSheet(
      sheetAnimationStyle: AnimationStyle(duration: Duration(seconds: 1)),
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => cartMenu(),
    );
  }

  double getTotalPrice() {
    double total = 0.0;
    cartItem.forEach((fruit, count) {
      total += (fruit.price ?? 0) * count;
    });
    return total;
  }

  Widget cartMenu() {
    return Column(
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
              itemCount: cartItem.length, // ✅ استخدم عدد عناصر السلة
              itemBuilder: (context, index) {
                final fruit = cartItem.keys.elementAt(
                  index,
                ); // ✅ المفتاح هو العنصر نفسه من type Fruits
                int count = getCount(fruit); // ✅ بدون مشاكل
                double? price = fruit.price;
                double total = count * price!;
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
                          ), // ✅ صورة الفاكهة
                        ),
                      ),
                      title: Text(
                        fruit.nameOfFruit!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "\$${fruit.price}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        "You ordered : $count items\n"
                        "Price of order : \$${total.toStringAsFixed(2)}",
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Text(
          "Total price is \$ ${getTotalPrice().toStringAsFixed(2)}",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        SizedBox(height: 35),
      ],
    );
  }

  int getCount(Fruits product) => cartItem[product] ?? 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      ///
      ///
      ///
      ///
      ///
      ///
      ///
      ///
      // ال App Bar بتاع التطبيق
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Icon(Icons.delivery_dining, size: 35),
              SizedBox(width: 10),
              Text("61 Hopper street..", style: TextStyle(fontSize: 20)),
              SizedBox(width: 5),
              Icon(Icons.keyboard_arrow_down, size: 30),
              Spacer(),
              Icon(Icons.shopping_bag, size: 30),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 2,
      ),

      ///
      ///
      ///
      ///
      ///
      ///
      ///
      ///
      ///
      // ال Body بتاع التطبيق
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///
            ///
            ///
            ///
            ///
            ///
            // ال Slider اللي بتلف لوحدها في التطبيق
            SizedBox(
              height: 280,
              width: double.infinity,
              child: CarouselSlider.builder(
                itemCount: cards.length,
                options: CarouselOptions(
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.2,
                ),
                itemBuilder: (context, index, realIndex) => cards[index],
              ),
            ),
            Container(
              height: 160,
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: listView.length,
                scrollDirection: Axis.horizontal,
                itemBuilder:
                    (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: listView[index],
                    ),
              ),
            ),

            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                children: [
                  // كلمة fruit
                  Text(
                    "Fruit",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),

                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  // كلمة See all
                  GestureDetector(
                    onTap: () => modelBottonSheet(),
                    child: Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0CA201),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff0CA201),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 275,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listFruits.length,
                itemBuilder: (context, index) {
                  final fruit = listFruits[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white70,
                      ),
                      height: 250,
                      width: 200,
                      child: ListOfFruits(
                        imageOfFruit: fruit.imageOfFruit!,
                        nameOfFruit: fruit.nameOfFruit!,
                        price: fruit.price!,
                        counter: getCount(fruit),
                        onIncrement: () => addToCart(fruit),
                        onDecrement: () => removeFromCart(fruit),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xff0CA201),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 200,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cartItem.length,
                            itemBuilder: (context, index) {
                              final fruit = cartItem.keys.elementAt(index);
                              return Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Badge(
                                  backgroundColor: Colors.red,
                                  label: Text(cartItem[fruit].toString()),
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                        fruit.imageOfFruit!,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      RotatedBox(
                        quarterTurns: 1,
                        child: SizedBox(
                          width: 40,
                          height: 10,
                          child: Divider(color: Colors.white, thickness: 2),
                        ),
                      ),
                      SizedBox(width: 5),
                      TextButton(
                        style: ButtonStyle(
                          animationDuration: Duration(seconds: 1),
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.green[200],
                          ),
                        ),
                        onPressed: () => modelBottonSheet(),
                        child: Row(
                          children: [
                            Badge(
                              largeSize: 12,
                              backgroundColor: Colors.red,
                              label: Text(
                                cartItem.values
                                    .fold<int>(0, (sum, count) => sum + count)
                                    .toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                              child: Icon(
                                Icons.shopping_bag,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 13),
                            Text(
                              "View Basket",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
