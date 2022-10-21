abstract class AppAnimations {
  String get splashscreen;
}

class AppAnimationsTheme implements AppAnimations {
  @override
  String get splashscreen => "assets/animations/hacker.json";
}
