import 'package:animate_do/animate_do.dart';
import 'package:ecommerce/List.dart';
import 'package:ecommerce/ReuseableButton.dart';
import 'package:ecommerce/ReuseableRowForCart.dart';
import 'package:ecommerce/MainWrapper.dart';
import 'package:ecommerce/BaseModel.dart';
import 'package:ecommerce/Color.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double calculateTotalPrice() {
    double total = 0.0;
    if (itemsOnCart.isEmpty) return 0;
    for (BaseModel data in itemsOnCart) {
      total += data.price * data.value;
    }
    return total;
  }

  double calculateShipping() {
    if (itemsOnCart.isEmpty) return 0.0;
    return itemsOnCart.length <= 4 ? 25.99 : 88.99;
  }

  double calculateSubTotalPrice() {
    double subTotal = 0.0;
    if (itemsOnCart.isEmpty) return 0;
    for (BaseModel data in itemsOnCart) {
      subTotal += data.price;
    }
    return subTotal - 160 < 0 ? 0 : subTotal - 160;
  }

  void onDelete(BaseModel data) {
    setState(() {
      itemsOnCart.removeWhere((element) => element.id == data.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.6,
              child: itemsOnCart.isEmpty
                  ? Column(
                      children: [
                        FadeInUp(
                          delay: const Duration(milliseconds: 200),
                          child: const Image(
                            image: AssetImage("assets/empty.png"),
                            fit: BoxFit.contain,
                            height: 180,
                          ),
                        ),
                        const SizedBox(height: 10),
                        FadeInUp(
                          delay: const Duration(milliseconds: 250),
                          child: Text(
                            "Your cart is empty!",
                            style: textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        FadeInUp(
                          delay: const Duration(milliseconds: 300),
                          child: Text(
                            "Start adding items to your cart",
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        FadeInUp(
                          delay: const Duration(milliseconds: 350),
                          child: IconButton(
                            onPressed: () {
                              if (mounted) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainWrapper(),
                                  ),
                                );
                              }
                            },
                            icon: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.black,
                              size: 28,
                            ),
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: itemsOnCart.length,
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      itemBuilder: (context, index) {
                        var current = itemsOnCart[index];
                        return FadeInUp(
                          delay: Duration(milliseconds: 100 * index + 80),
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                  ),
                                  child: Image.asset(
                                    current.imageUrl,
                                    width: size.width * 0.4,
                                    height: size.height * 0.18,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              current.name,
                                              style:
                                                  textTheme.bodyLarge?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () =>
                                                  onDelete(current),
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: "\$",
                                            style:
                                                textTheme.titleMedium?.copyWith(
                                              fontSize: 16,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: current.price
                                                    .toStringAsFixed(2),
                                                style: textTheme.titleMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Size: M",
                                          style: textTheme.bodyMedium?.copyWith(
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (current.value > 1) {
                                                    current.value--;
                                                  } else {
                                                    onDelete(current);
                                                  }
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.remove,
                                                size: 18,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              current.value.toString(),
                                              style: textTheme.titleMedium
                                                  ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  current.value++;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.add,
                                                size: 18,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Gift Cards",
                              style: textTheme.bodyMedium
                                  ?.copyWith(color: Colors.grey, fontSize: 14)),
                          const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.grey,
                            size: 15,
                          ),
                        ],
                      ),
                      const Divider(height: 10),
                      ReuseableRowForCart(
                        price: calculateSubTotalPrice(),
                        text: 'Subtotal',
                      ),
                      ReuseableRowForCart(
                        price: calculateShipping(),
                        text: 'Shipping',
                      ),
                      const Divider(),
                      ReuseableRowForCart(
                        price: calculateTotalPrice(),
                        text: 'Total',
                      ),
                      const SizedBox(height: 10),
                      ReuseableButton(
                        text: "Checkout",
                        onTap: () {
                          if (mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Cart(),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
