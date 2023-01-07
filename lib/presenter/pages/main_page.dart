import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malika/cubit/cubit.dart';
import 'package:malika/presenter/pages/grocery_page.dart';
import 'package:malika/presenter/pages/home_page.dart';
import 'package:malika/presenter/pages/search_page.dart';
import 'package:malika/themes.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentBottomIndex = 0;

  Widget customBottomNavigation() {
    return BottomAppBar(
      color: Colors.transparent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentBottomIndex,
        onTap: (index) => {
          if (index != 2)
            {
              setState((() {
                _currentBottomIndex = index;
              }))
            }
        },
        enableFeedback: false,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        items: const [
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('images/ic_home.png'),
              height: 24,
              width: 24,
            ),
            activeIcon: Image(
              image: AssetImage('images/ic_home_active.png'),
              height: 24,
              width: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('images/ic_search.png'),
              height: 24,
              width: 24,
            ),
            activeIcon: Image(
              image: AssetImage('images/ic_search_active.png'),
              height: 24,
              width: 24,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(label: '', icon: SizedBox()),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('images/ic_cart.png'),
              height: 24,
              width: 24,
            ),
            activeIcon: Image(
              image: AssetImage('images/ic_cart_active.png'),
              height: 24,
              width: 24,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('images/ic_calendar.png'),
              height: 24,
              width: 24,
            ),
            activeIcon: Image(
              image: AssetImage('images/ic_calendar_active.png'),
              height: 24,
              width: 24,
            ),
            label: 'Schedule',
          ),
        ],
      ),
    );
  }

  Widget getMainPage() {
    switch (_currentBottomIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const SearchRecipePage();
      case 3:
        return const GroceryPage();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLogout) {
          context.go('/');
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: getMainPage(),
          ),
          bottomNavigationBar: customBottomNavigation(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () {
              context.read<AuthCubit>().logoutUser();
            },
            elevation: 0,
            child: Image(
              image: const AssetImage('images/ic_add.png'),
              width: defaultMargin,
              height: defaultMargin,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          resizeToAvoidBottomInset: false,
        );
      },
    );
  }
}
