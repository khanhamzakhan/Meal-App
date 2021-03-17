import '../Widgets/Meal.dart';
import 'package:flutter/material.dart';
import '../Widgets/mealItem.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meal';

  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categorytitle;
  List<Meal> categoryMeals;
  var _didChange = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_didChange) {
      final argsRoute =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categorytitle = argsRoute['title'];
      final categoryId = argsRoute['id'];
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _didChange = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
            );
          },
          itemCount: categoryMeals.length),
    );
  }
}
