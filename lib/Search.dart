import 'package:animate_do/animate_do.dart';
import 'package:ecommerce/List.dart';
import 'package:ecommerce/AddToCart.dart';
import 'package:ecommerce/BaseModel.dart';
import 'package:ecommerce/details.dart';
import 'package:ecommerce/Color.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    itemsOnSearch = mainList;
    super.initState();
  }

  onSearch(String search) {
    setState(() {
      itemsOnSearch = mainList
          .where((element) => element.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              FadeInUp(
                delay: const Duration(milliseconds: 50),
                child: TextField(
                  controller: controller,
                  onChanged: (value) => onSearch(value),
                  style: textTheme.headlineMedium?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 20,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.clear();
                        FocusManager.instance.primaryFocus?.unfocus();
                        setState(() {
                          itemsOnSearch = mainList;
                        });
                      },
                      icon: const Icon(Icons.close, color: Colors.grey),
                    ),
                    hintStyle: textTheme.headlineMedium?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                    hintText: "Search here...",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: itemsOnSearch.isNotEmpty
                    ? GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: itemsOnSearch.length,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          BaseModel current = itemsOnSearch[index];
                          return FadeInUp(
                            delay: Duration(milliseconds: 100 * index),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Details(
                                    data: current,
                                    isCameFromMostPopularPart: false,
                                  ),
                                ),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    top: size.height * 0.02,
                                    left: size.width * 0.01,
                                    right: size.width * 0.01,
                                    child: Container(
                                      width: size.width * 0.5,
                                      height: size.height * 0.25,
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(current.imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 5,
                                            offset: const Offset(0, 5),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: size.height * 0.07,
                                    child: Text(
                                      current.name,
                                      style: textTheme.bodyLarge?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: primaryColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: size.height * 0.04,
                                    child: RichText(
                                      text: TextSpan(
                                        text: "\$",
                                        style: textTheme.titleLarge?.copyWith(
                                          color: primaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: current.price.toString(),
                                            style:
                                                textTheme.titleLarge?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: primaryColor,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: size.height * 0.02,
                                    right: size.width * 0.03,
                                    child: CircleAvatar(
                                      backgroundColor: primaryColor,
                                      radius: 18,
                                      child: IconButton(
                                        onPressed: () {
                                          AddToCart.addToCart(current, context);
                                        },
                                        icon: const Icon(
                                          LineIcons.addToShoppingCart,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FadeInUp(
                              delay: const Duration(milliseconds: 200),
                              child: const Image(
                                image: AssetImage("assets/search_fail.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 10),
                            FadeInUp(
                              delay: const Duration(milliseconds: 250),
                              child: Text(
                                "No Results Found",
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
