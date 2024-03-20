// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:shopping_list/data/category.dart';
// // import 'package:shopping_list/models/grocery_item.dart';
// // import 'package:shopping_list/widgets/new_item.dart';
// // import 'package:http/http.dart' as http;

// // class GroceryList extends StatefulWidget {
// //   const GroceryList({super.key});

// //   @override
// //   State<GroceryList> createState() => _GroceryListState();
// // }

// // class _GroceryListState extends State<GroceryList> {
// //   List<GroceryItem> _groceryItems = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadItems();
// //   }

// //   void _loadItems() async {
// //     final url = Uri.https("flutter-project-ae7d1-default-rtdb.firebaseio.com",
// //         "shopping-list.json");

// //     final response = await http.get(url);

// //     final Map<String, dynamic> listData = json.decode(response.body);
// //     final List<GroceryItem> loadedItems = [];
// //     // for (final item in listData.entries) {
// //     //   final category = categories.entries
// //     //       .firstWhere(
// //     //           (catItem) => catItem.value.title == item.value['category'])
// //     //       .value;
// //   listData.entries.forEach((item) {
// //     final category = categories.entries
// //         .firstWhere((catItem) => catItem.value.title == item.value['category'])
// //         .value;

// //     // Ensure 'name' and 'quantity' are not null
// //     final itemName = item.value['name'] ?? 'Unknown';
// //     final itemQuantity = item.value['quantity'] ?? 0;
// //       loadedItems.add(
// //         GroceryItem(
// //           id: item.key,
// //           name: item.value['name'],
// //           quantity: item.value['quantity'],
// //           category: category,
// //         ),
// //       );
// //     }
// //     setState(() {
// //       _groceryItems = loadedItems;
// //     });

// //     // ignore: avoid_print
// //     print(response.body);
// //   }

// //   void _addItem() async {
// //     //final newItem =
// //     await Navigator.of(context).push<GroceryItem>(
// //       MaterialPageRoute(
// //         builder: (ctx) => const NewItem(),
// //       ),
// //     );
// //     // if (newItem == null) {
// //     //   //print(_groceryItems);

// //     //   return;
// //     // }
// //     // setState(() {
// //     //   _groceryItems.add(newItem);
// //     // });
// //     _loadItems();
// //   }

// //   void _removeItem(GroceryItem item) {
// //     setState(() {
// //       _groceryItems.remove(item);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     Widget content = const Center(child: Text("No item added yet ."));
// //     if (_groceryItems.isNotEmpty) {
// //       content = ListView.builder(
// //         itemCount: _groceryItems.length,
// //         itemBuilder: (ctx, index) => Dismissible(
// //           onDismissed: (direction) {
// //             _removeItem(_groceryItems[index]);
// //           },
// //           key: ValueKey(_groceryItems[index].id),
// //           child: ListTile(
// //             title: Text(
// //               _groceryItems[index].name,
// //             ),
// //             leading: Container(
// //               width: 24,
// //               height: 24,
// //               color: _groceryItems[index].category.color,
// //             ),
// //             trailing: Text(
// //               _groceryItems[index].quantity.toString(),
// //             ),
// //           ),
// //         ),
// //       );
// //     }

// //     return Scaffold(
// //       appBar: AppBar(title: const Text("Your Groceries"), actions: [
// //         IconButton(
// //           onPressed: () {
// //             _addItem();
// //           },
// //           icon: const Icon(Icons.add),
// //         )
// //       ]),
// //       body: content,
// //     );
// //   }
// // }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shopping_list/data/category.dart';
// import 'package:shopping_list/models/grocery_item.dart';
// import 'package:shopping_list/widgets/new_item.dart';
// import 'package:http/http.dart' as http;

// class GroceryList extends StatefulWidget {
//   const GroceryList({super.key});

//   @override
//   State<GroceryList> createState() => _GroceryListState();
// }

// class _GroceryListState extends State<GroceryList> {
//   List<GroceryItem> _groceryItems = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadItems();
//   }

//   void _loadItems() async {
//     final url = Uri.https("flutter-project-ae7d1-default-rtdb.firebaseio.com",
//         "shopping-list.json");

//     final response = await http.get(url);

//     final Map<String, dynamic> listData = json.decode(response.body);
//     final List<GroceryItem> loadedItems = [];

//     var _isLoading = true;

//     for (var item in listData.entries) {
//       final category = categories.entries
//           .firstWhere(
//               (catItem) => catItem.value.title == item.value['category'])
//           .value;

//       // Ensure 'name' and 'quantity' are not null
//       final itemName = item.value['name'] ?? 'Unknown';
//       final itemQuantity = item.value['quantity'] ?? 0;

//       loadedItems.add(
//         GroceryItem(
//           id: item.key,
//           name: itemName,
//           quantity: itemQuantity,
//           category: category,
//         ),
//       );
//     }

//     setState(() {
//       _groceryItems = loadedItems;
//     });

//     // ignore: avoid_print
//     print(response.body);
//   }

//   void _addItem() async {
//     //final newItem =
//     await Navigator.of(context).push<GroceryItem>(
//       MaterialPageRoute(
//         builder: (ctx) => const NewItem(),
//       ),
//     );
//     // if (newItem == null) {
//     //   //print(_groceryItems);
//     //   return;
//     // }
//     setState(() {
//       _groceryItems = loadedItems;
//       _isLoading = false;
//     });
//     //   _loadItems();
//   }

//   void _removeItem(GroceryItem item) {
//     setState(() {
//       _groceryItems.remove(item);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget content = const Center(child: Text("No item added yet ."));

//     if (_isLoading) {
//       content = const Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//     if (_groceryItems.isNotEmpty) {
//       content = ListView.builder(
//         itemCount: _groceryItems.length,
//         itemBuilder: (ctx, index) => Dismissible(
//           onDismissed: (direction) {
//             _removeItem(_groceryItems[index]);
//           },
//           key: ValueKey(_groceryItems[index].id),
//           child: ListTile(
//             title: Text(
//               _groceryItems[index].name,
//             ),
//             leading: Container(
//               width: 24,
//               height: 24,
//               color: _groceryItems[index].category.color,
//             ),
//             trailing: Text(
//               _groceryItems[index].quantity.toString(),
//             ),
//           ),
//         ),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Your Groceries"),
//         actions: [
//           IconButton(
//             onPressed: () {
//               _addItem();
//             },
//             icon: const Icon(Icons.add),
//           )
//         ],
//       ),
//       body: content,
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/category.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  var _isLoading = true; // Add _isLoading variable
  String? _error;
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
      "flutter-project-ae7d1-default-rtdb.firebaseio.com",
      "shopping-list.json",
    );

    try {
      final response = await http.get(url);

      if (response.statusCode >= 400) {
        setState(() {
          _error = "Failed to  fetch data. Please try again later";
        });
      }

      print(response.statusCode);

      final Map<String, dynamic> listData = json.decode(response.body);
      final List<GroceryItem> loadedItems = [];

      for (var item in listData.entries) {
        final category = categories.entries
            .firstWhere(
              (catItem) => catItem.value.title == item.value['category'],
            )
            .value;

        // Ensure 'name' and 'quantity' are not null
        final itemName = item.value['name'] ?? 'Unknown';
        final itemQuantity = item.value['quantity'] ?? 0;

        loadedItems.add(
          GroceryItem(
            id: item.key,
            name: itemName,
            quantity: itemQuantity,
            category: category,
          ),
        );
      }

      setState(() {
        _groceryItems = loadedItems;
        _isLoading = false; // Update _isLoading when items are loaded
      });

      // ignore: avoid_print
      print(response.body);
    } catch (error) {
      // Handle error
      print('Error loading items: $error');
    }
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if (newItem != null) {
      setState(() {
        _groceryItems.add(newItem);
      });
    }
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: CircularProgressIndicator());

    if (!_isLoading) {
      if (_groceryItems.isNotEmpty) {
        content = ListView.builder(
          itemCount: _groceryItems.length,
          itemBuilder: (ctx, index) => Dismissible(
            onDismissed: (direction) {
              _removeItem(_groceryItems[index]);
            },
            key: ValueKey(_groceryItems[index].id),
            child: ListTile(
              title: Text(_groceryItems[index].name),
              leading: Container(
                width: 24,
                height: 24,
                color: _groceryItems[index].category.color,
              ),
              trailing: Text(_groceryItems[index].quantity.toString()),
            ),
          ),
        );
      } else {}
    }

    if (_error != null) {
      content = Center(
        child: Text(_error!),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
