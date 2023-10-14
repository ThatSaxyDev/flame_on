import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_on/flame_adventure.dart';

enum PlayerState { idle, running }

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<FlameAdventure> {
  String character;
  Player({
    required this.character,
    position,
  }) : super(position: position);

  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runningAnimation;

  final double stepTime = 0.05;

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }

  void _loadAllAnimations() {
    idleAnimation = _spriteAnimation(amount: 11, state: 'Idle');

    runningAnimation = _spriteAnimation(amount: 12, state: 'Run');

    //! list of animations
    animations = {
      PlayerState.idle: idleAnimation,
      PlayerState.running: runningAnimation,
    };

    //! set current animation
    current = PlayerState.idle;
  }

  SpriteAnimation _spriteAnimation({
    required int amount,
    required String state,
  }) =>
      SpriteAnimation.fromFrameData(
        game.images.fromCache('Main Characters/$character/$state (32x32).png'),
        SpriteAnimationData.sequenced(
          amount: amount,
          stepTime: stepTime,
          textureSize: Vector2.all(32),
        ),
      );
}
