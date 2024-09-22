import 'package:estore/core/assets_manager/assets_manager.dart';
import 'package:estore/data/models/categories_model.dart';
import 'package:estore/data/models/selected_filter_model.dart';
import 'package:estore/presentation/screens/home_layout/tab_pages/home_page.dart';
import 'package:estore/presentation/screens/home_layout/tab_pages/notification_page/notifications_page.dart';
import 'package:estore/presentation/screens/home_layout/tab_pages/orders_page/orders_page.dart';
import 'package:estore/presentation/screens/home_layout/tab_pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/order_status.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);
  int bottomNavigationIndex = 0;
  int quantity = 1;
  int pageIndex = 0;
  bool listTileEnabled = false;
  bool onSubmitted = false;
  String _selectedSizeName = 'S';
  Color _productSelectedColor = Colors.red;
  bool isFavourite = false;

  Color get productSelectedColor => _productSelectedColor;

  String get selectedSizeName => _selectedSizeName;
  List<Widget> homeLayoutTabs = [
    const HomePage(),
    const NotificationsPage(),
    const OrdersPage(),
    const ProfilePage(),
  ];
  List<OrderStatus> allStatus = [
    OrderStatus(statusDone: true, statusName: 'Processing'),
    OrderStatus(statusDone: false, statusName: 'Shipped'),
    OrderStatus(statusDone: false, statusName: 'Delivered'),
    OrderStatus(statusDone: false, statusName: 'Returned'),
    OrderStatus(statusDone: false, statusName: 'Cancelled'),
  ];
  List<CategoriesModel> categoryPreview = [
    CategoriesModel(name: 'jacket', image: ImagesManager.jacket),
    CategoriesModel(name: 'jacket', image: ImagesManager.jacket),
    CategoriesModel(name: 'jacket', image: ImagesManager.jacket),
    CategoriesModel(name: 'jacket', image: ImagesManager.jacket),
    CategoriesModel(name: 'jacket', image: ImagesManager.jacket),
  ];
  final int notifications = 1;
  final int orders = 1;
  List<SelectedFilterModel> sortByFilter = [
    SelectedFilterModel(name: 'Recommended', selected: true),
    SelectedFilterModel(name: 'Newest', selected: false),
    SelectedFilterModel(name: 'Lowest-Highest price', selected: false),
    SelectedFilterModel(name: 'Highest-Lowest price', selected: false),
  ];
  List<SelectedFilterModel> dealsFilter = [
    SelectedFilterModel(name: 'On sale', selected: true),
    SelectedFilterModel(name: 'Free Shipping Eligible', selected: false),
  ];
  List<SelectedFilterModel> genderFilter = [
    SelectedFilterModel(name: 'Men', selected: true),
    SelectedFilterModel(name: 'Women', selected: false),
    SelectedFilterModel(name: 'kids', selected: false),
  ];
  List<SelectedFilterModel> sizeFilter = [
    SelectedFilterModel(name: 'S', selected: true),
    SelectedFilterModel(name: 'M', selected: false),
    SelectedFilterModel(name: 'L', selected: false),
    SelectedFilterModel(name: 'XL', selected: false),
    SelectedFilterModel(name: '2XL', selected: false),
  ];
  List<ColorFilterModel> colorFilter = [
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'red', selected: true),
        color: Colors.red),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'blue', selected: false),
        color: Colors.blue),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'green', selected: false),
        color: Colors.green),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'yellow', selected: false),
        color: Colors.yellow),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'orange', selected: false),
        color: Colors.orange),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'purple', selected: false),
        color: Colors.purple),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'pink', selected: false),
        color: Colors.pink),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'brown', selected: false),
        color: Colors.brown),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'black', selected: false),
        color: Colors.black),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'white', selected: false),
        color: Colors.white),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'grey', selected: false),
        color: Colors.grey),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'cyan', selected: false),
        color: Colors.cyan),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'lime', selected: false),
        color: Colors.lime),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'indigo', selected: false),
        color: Colors.indigo),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'teal', selected: false),
        color: Colors.teal),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'amber', selected: false),
        color: Colors.amber),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'deepOrange', selected: false),
        color: Colors.deepOrange),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'lightBlue', selected: false),
        color: Colors.lightBlue),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'lightGreen', selected: false),
        color: Colors.lightGreen),
    ColorFilterModel(
        filter: SelectedFilterModel(name: 'deepPurple', selected: false),
        color: Colors.deepPurple),
  ];
  bool cartIsEmpty = false;


  void changePageIndex(int index) {
    bottomNavigationIndex = index;
    pageIndex = index;
    emit(ChangePageIndexState());
  }

  void changeOrderStatus(int index) {
    for (int i = 0; i < allStatus.length; i++) {
      if (i == index) {
        allStatus[i].statusDone = true;
      } else {
        allStatus[i].statusDone = false;
      }
    }
    emit(ChangeOrderState());
  }

  void changeState(int state) {
    if (state == 1) {
      emit(SearchInitState());
    } else if (state == 2) {
      emit(FoundState());
    } else {
      emit(NotFoundState());
    }
  }

  void changeSortBy(String name) {
    for (int i = 0; i < sortByFilter.length; i++) {
      if (sortByFilter[i].name == name) {
        sortByFilter[i].selected = true;
      } else {
        sortByFilter[i].selected = false;
      }
    }
    emit(ChangeSortByState());
  }

  void changeDeals(String name) {
    for (int i = 0; i < dealsFilter.length; i++) {
      if (dealsFilter[i].name == name) {
        dealsFilter[i].selected = true;
      } else {
        dealsFilter[i].selected = false;
      }
    }
    emit(ChangeDealsState());
  }

  void changeGenderFilter(String name) {
    for (int i = 0; i < genderFilter.length; i++) {
      if (genderFilter[i].name == name) {
        genderFilter[i].selected = true;
      } else {
        genderFilter[i].selected = false;
      }
    }
    emit(ChangeGenderFilterState());
  }

  void changeSizeFilter(String name) {
    for (int i = 0; i < sizeFilter.length; i++) {
      if (sizeFilter[i].name == name) {
        sizeFilter[i].selected = true;
        _selectedSizeName = sizeFilter[i].name;
      } else {
        sizeFilter[i].selected = false;
      }
    }
    emit(ChangeSizeFilterState());
  }

  void changeColorFilter(String name) {
    for (int i = 0; i < colorFilter.length; i++) {
      if (colorFilter[i].filter.name == name) {
        colorFilter[i].filter.selected = true;
        _productSelectedColor = colorFilter[i].color;
      } else {
        colorFilter[i].filter.selected = false;
      }
    }
    emit(ChangeColorFilterState());
  }

  void increaseQuantity() {
    if (quantity <= 98) {
      quantity++;
    }
    emit(IncreaseQuantityState());
  }

  void decreaseQuantity() {
    if (quantity >= 2) {
      quantity--;
    }
    emit(DecreaseQuantityState());
  }

  void changeFavourite() {
    isFavourite = !isFavourite;
    emit(ChangeFavouriteState());
  }
}
