import 'package:nano_health/features/home/models/enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_navbar_type_provider.g.dart';

@riverpod
class BottomNavbarType extends _$BottomNavbarType {
  @override
  NavbarType build() => NavbarType.home;

  void setTypeFromIndex(int index) => state = NavbarType.values[index];
}
