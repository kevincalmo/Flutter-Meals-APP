import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // par défaut la liste des favoris est vide
  FavoriteMealsNotifier() : super([]);

  // On ne peut pas ajouter ni supprimer en utilisant le provider
  // Il faut obligatoirement recréer une nouvelle liste
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      // supprimer un meal
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      //  Ajouter un meal
      state = [...state, meal];
      return true;
    }
  }
}

//StateNotifierProvider< Nom de la classe défini,Type de donnée attendu >
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
