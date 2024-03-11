import 'package:shopping_list/category.dart';
import 'package:shopping_list/models/categories.dart';
import 'package:shopping_list/models/grocery_item.dart';

final groceryItems = [
  GroceryItem(
      id: 'a',
      name: 'Milk',
      quantity: 1,
      category: categories[Categories.dairy]!),
  GroceryItem(
      id: 'b',
      name: "Banana ",
      quantity: 5,
      category: categories[Categories.fruits]!),
  GroceryItem(
      id: 'c',
      name: "Buff",
      quantity: 3,
      category: categories[Categories.meat]!),
];
