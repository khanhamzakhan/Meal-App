import '../Widgets/mealItem.dart';
import 'package:flutter/material.dart';
import '../Widgets/Meal.dart';

class Favourites_Screen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  Favourites_Screen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favoutes yet start Adding some'),
      );
    } else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favouriteMeals[index].id,
              title: favouriteMeals[index].title,
              imageUrl: favouriteMeals[index].imageUrl,
              duration: favouriteMeals[index].duration,
              complexity: favouriteMeals[index].complexity,
              affordability: favouriteMeals[index].affordability,
            );
          },
          itemCount: favouriteMeals.length);
    }
  }
}
