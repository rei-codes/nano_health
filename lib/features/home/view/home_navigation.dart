import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nano_health/core/utils/assets.dart';

import '../providers/bottom_navbar_type_provider.dart';
import 'pages/cart_page.dart';
import 'pages/favorites_page.dart';
import 'pages/profile_page.dart';

class HomeNavigation extends HookConsumerWidget {
  const HomeNavigation({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final type = ref.watch(bottomNavbarTypeProvider);

    final getColor = useCallback(
      (int index) => ColorFilter.mode(
        type.index == index ? Colors.green : Colors.grey,
        BlendMode.srcIn,
      ),
      [type],
    );

    return Scaffold(
      body: IndexedStack(
        index: type.index,
        children: const [
          HomeNavigation(),
          CartPage(),
          FavoritesPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: type.index,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          ref.read(bottomNavbarTypeProvider.notifier).setTypeFromIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              R.icons.home,
              colorFilter: getColor(0),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              R.icons.cart,
              colorFilter: getColor(1),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              R.icons.favorites,
              colorFilter: getColor(2),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              R.icons.profile,
              colorFilter: getColor(3),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
