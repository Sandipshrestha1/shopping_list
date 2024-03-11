import 'package:flutter/material.dart';
import 'package:shopping_list/models/categories.dart';

const categories = {
  Categories.vegetables: Category(
    "vegetables",
    Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.fruits: Category(
    "fruits",
    Color.fromARGB(255, 255, 10, 10),
  ),
  Categories.meat: Category(
    "meat ",
    Color.fromARGB(255, 240, 110, 10),
  ),
  Categories.dairy: Category(
    "dairy",
    Color.fromARGB(255, 233, 233, 250),
  ),
  Categories.carbs: Category(
    "carbs",
    Color.fromARGB(255, 56, 50, 50),
  ),
  Categories.spices: Category(
    "Spices",
    Color.fromARGB(255, 90, 220, 70),
  ),
  Categories.hygiene: Category(
    "Hygine",
    Color.fromARGB(255, 20, 20, 255),
  ),
  Categories.other: Category(
    "Others",
    Color.fromARGB(255, 10, 10, 240),
  ),
};
