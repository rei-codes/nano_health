abstract final class R {
  const R._();

  static const icons = _Icons();
  static const images = _Images();
}

final class _Icons {
  const _Icons();

  static String _path(String name) => 'assets/icons/$name.svg';

  String get home => _path('home');
  String get cart => _path('cart');
  String get favorites => _path('favorites');
  String get profile => _path('profile');
}

final class _Images {
  const _Images();

  static String _path(String name) => 'assets/images/$name.png';

  String get logo => _path('logo');
}
