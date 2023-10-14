import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_on/levels/level.dart';

class FlameAdventure extends FlameGame {
  late final CameraComponent cam;

  @override
  Color backgroundColor() => const Color(0xFF211F30);

  @override
  final world = Level(levelName: 'Level-02');

  @override
  FutureOr<void> onLoad() async {
    //! load all images into cache
    await images.loadAllImages();
    cam = CameraComponent.withFixedResolution(
      width: 640,
      height: 360,
      world: world,
    );
    cam.viewfinder.anchor = Anchor.topLeft;
    addAll([cam, world]);

    return super.onLoad();
  }
}
