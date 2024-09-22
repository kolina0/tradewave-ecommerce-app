part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}
final class ChangePageIndexState extends AppState {}
final class ChangeOrderState extends AppState {}
final class SearchInitState extends AppState {}
final class NotFoundState extends AppState {}
final class FoundState extends AppState {}
final class ChangeSortByState extends AppState {}
final class ChangeGenderFilterState extends AppState {}
final class ChangeDealsState extends AppState {}
final class IncreaseQuantityState extends AppState {}
final class DecreaseQuantityState extends AppState {}
final class ChangeSizeFilterState extends AppState {}
final class ChangeColorFilterState extends AppState {}
final class ChangeFavouriteState extends AppState {}
