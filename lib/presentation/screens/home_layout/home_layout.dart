import 'package:estore/business_logic/app_cubit/app_cubit.dart';
import 'package:estore/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/assets_manager/icon_broken.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  AppCubit cubit=AppCubit();
  int index = 0;
  @override
  void didChangeDependencies() {
    cubit=AppCubit.get(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
  builder: (context, state) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 8.h,
        child: BottomNavigationBar
          (
          elevation: 50,
          iconSize: 20.sp,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: cubit.bottomNavigationIndex,
          onTap: cubit.changePageIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(IconBroken.home,),label:'home' ),
            BottomNavigationBarItem(icon: Icon(IconBroken.notification,),label: 'notifications'),
            BottomNavigationBarItem(icon: Icon(IconBroken.document,),label: 'orders'),
            BottomNavigationBarItem(icon: Icon(IconBroken.profile,),label: 'profile'),
          ],
        ),
      ),
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: IndexedStack(
          index: cubit.pageIndex,
          children:cubit.homeLayoutTabs,
        ),
      ),
    );
  },
);
  }
}
