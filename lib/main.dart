import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_on/flame_adventure.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  FlameAdventure game = FlameAdventure();
  runApp(GameWidget(
    game: kDebugMode ? FlameAdventure() : game,
  ));
}
