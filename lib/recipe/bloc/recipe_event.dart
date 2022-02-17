
part of 'recipe_bloc.dart';

class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object> get props => [];
}


class RefreshRecipe extends RecipeEvent {
  final String languageCode;

  const RefreshRecipe(this.languageCode);
}