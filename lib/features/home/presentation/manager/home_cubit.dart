import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/features/chat_tab/presentation/screens/chat_tab_screen.dart';
import 'package:wasel_app/features/favorites_tab/presentation/screens/favorites_tab_screen.dart';
import 'package:wasel_app/features/home/presentation/manager/home_states.dart';
import 'package:wasel_app/features/home_tab/presentation/screens/home_tab_screen.dart';
import 'package:wasel_app/features/my_books_tab/presentation/screens/my_books_tab_screen.dart';
import 'package:wasel_app/features/profile_tab/presentation/screens/profile_tab_screen.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit() : super(HomeInitialState());

  final List<NavigationDestination> items = const [
    NavigationDestination(
      icon: Icon(
        Icons.home_outlined,
        size: 26,
      ),
      selectedIcon: Icon(
        Icons.home,
        color: AppColors.whiteColor,
        size: 28,
      ),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(
        Icons.favorite_border_outlined,
        size: 26,
      ),
      selectedIcon: Icon(
        Icons.favorite,
        color: AppColors.whiteColor,
        size: 28,
      ),
      label: 'Favorites',
    ),
    NavigationDestination(
      icon: Icon(
        Icons.chat_outlined,
        size: 26,
      ),
      selectedIcon: Icon(
        Icons.chat,
        color: AppColors.whiteColor,
        size: 28,
      ),
      label: 'Chat',
    ),
    NavigationDestination(
      icon: Icon(
        Icons.menu_book_outlined,
        size: 26,
      ),
      selectedIcon: Icon(
        Icons.menu_book,
        color: AppColors.whiteColor,
        size: 28,
      ),
      label: 'My Books',
    ),
    NavigationDestination(
      icon: Icon(
        Icons.person_outline,
        size: 26,
      ),
      selectedIcon: Icon(
        Icons.person,
        color: AppColors.whiteColor,
        size: 28,
      ),
      label: 'Profile',

    ),
  ];
  final List<Widget> tabs = const [
    HomeTabScreen(),
    FavoritesTabScreen(),
    ChatTabScreen(),
    MyBooksTabScreen(),
    ProfileTabScreen(),
  ];
  int selectedIndex = 0;

  void changeSelectedTab({required int index}){
    selectedIndex = index;
    emit(ChangeSelectedTabState());
  }


}