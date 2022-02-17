part of 'recipe_bloc.dart';

class RecipeState extends Equatable {
  const RecipeState(
      {this.status = FetchStatus.uninitialized, this.recipes = const []});

  @override
  List<Object?> get props => [status, recipes];

  final FetchStatus status;
  final List<Recipe> recipes;

  RecipeState copyWith({
    FetchStatus? status,
    List<Recipe>? recipes,
  }) {
    return RecipeState(
      status: status ?? this.status,
      recipes: recipes ?? this.recipes,
    );
  }
}
