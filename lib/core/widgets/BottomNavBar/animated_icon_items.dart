import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:fixit_app/Models/rive_model.dart';

class AnimatedIconItems extends StatefulWidget {
  final RiveModel riveModel;
  final bool isActive;
  const AnimatedIconItems({
    super.key,
    required this.riveModel,
    required this.isActive,
  });

  @override
  State<AnimatedIconItems> createState() => _AnimatedIconItemsState();
}

class _AnimatedIconItemsState extends State<AnimatedIconItems> {
  StateMachineController? _controller;

  @override
  void didUpdateWidget(covariant AnimatedIconItems oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_controller != null) {
      _controller!.findInput<bool>('active')?.value = widget.isActive;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      height: 35,
      child: RiveAnimation.asset(
        widget.riveModel.src,
        artboard: widget.riveModel.artboard,
        stateMachines: [widget.riveModel.stateMachineName],
        onInit: (artboard) {
          try {
            _controller = StateMachineController.fromArtboard(
              artboard,
              widget.riveModel.stateMachineName,
            );
            if (_controller != null) {
              artboard.addController(_controller!);
              final activeInput = _controller!.findInput<bool>('active');
              if (activeInput != null) {
                activeInput.value = widget.isActive;
              }
            }
          } catch (e) {
            print("❌ Error initializing Rive: $e");
          }
        },
      ),
    );
  }
}
