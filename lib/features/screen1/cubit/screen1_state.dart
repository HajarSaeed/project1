part of 'screen1_cubit.dart';

@immutable
abstract class Screen1State {}

class Screen1Initial extends Screen1State {}
class CategoriesListSuccessState extends Screen1State {}
class CategoriesListLoadingState extends Screen1State {}
class CategoriesListFailureState extends Screen1State {}
