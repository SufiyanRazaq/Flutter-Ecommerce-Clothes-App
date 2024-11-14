import 'package:ecommerce/CategoriesModel.dart';
import 'package:ecommerce/BaseModel.dart';

List<CategoriesModel> categories = [
  CategoriesModel(
    imageUrl: "assets/product1.jpg",
    title: "Hats",
  ),
  CategoriesModel(
    imageUrl: "assets/product2.jpg",
    title: "Men",
  ),
  CategoriesModel(
    imageUrl: "assets/product7.jpg",
    title: "Glasses",
  ),
  CategoriesModel(
    imageUrl: "assets/product8.jpg",
    title: "Camera",
  ),
  CategoriesModel(
    imageUrl: "assets/product6.jpg",
    title: "Shoes",
  ),
  CategoriesModel(
    imageUrl: "assets/product7.jpg",
    title: "Glasses",
  ),
];

List<BaseModel> mainList = [
  BaseModel(
    imageUrl: "assets/product1.jpg",
    name: "Black Hat",
    price: 155.99,
    review: 3.6,
    star: 4.8,
    id: 1,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/product2.jpg",
    name: "Brown Shirt",
    price: 143.99,
    review: 5.6,
    star: 5.0,
    id: 2,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/product3.jpg",
    name: "Skin Coat",
    price: 212.99,
    review: 2.6,
    star: 3.7,
    id: 3,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/product4.jpg",
    name: "Greu Coat",
    price: 432.99,
    review: 1.4,
    star: 2.4,
    id: 4,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/product5.jpg",
    name: "Shoes",
    price: 112.99,
    review: 4.2,
    star: 1.8,
    id: 5,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/product6.jpg",
    name: "White Shirt",
    price: 320.99,
    review: 2.1,
    star: 3.1,
    id: 6,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/product7.jpg",
    name: "Glasses",
    price: 113.99,
    review: 3.1,
    star: 4.8,
    id: 7,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/product8.jpg",
    name: "Camera",
    price: 178.99,
    review: 2.6,
    star: 4.8,
    id: 8,
    value: 1,
  ),
];

List<BaseModel> itemsOnCart = [];
List<BaseModel> itemsOnSearch = [];
