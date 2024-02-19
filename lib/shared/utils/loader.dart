// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bu_ride/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:bu_ride/shared/app_widgets/myicon.dart';

class Loadinggg extends StatefulWidget {
  final double? height;
  final int? duration;
  final Color color;
  const Loadinggg({
    Key? key,
    this.height,
    this.duration,
    this.color = neutralWhite,
  }) : super(key: key);

  @override
  State<Loadinggg> createState() => _LoadingggState();
}

class _LoadingggState extends State<Loadinggg>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration ?? 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Center(
          child: RotationTransition(
            turns: _animationController,
            child: MyIcon(
              icon: 'tentSvg',
              height: widget.height ?? 20,
              color: widget.color,
            ),
          ),
        );
      },
    );
  }
}

class Rezult extends StatefulWidget {
  final Widget rezult;
  final double dimension;
  const Rezult({
    Key? key,
    required this.rezult,
    required this.dimension,
  }) : super(key: key);

  @override
  State<Rezult> createState() => _RezultState();
}

class _RezultState extends State<Rezult> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Center(
          child: SizedBox.square(
            dimension: widget.dimension + _animationController.value * 30.0,
            child: widget.rezult,
          ),
        );
      },
    );
  }
}
