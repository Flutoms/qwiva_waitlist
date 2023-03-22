import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qwiva_waitlist/helpers/global_assets.dart';

class QwivaAnimatedLogo extends StatefulWidget {
  const QwivaAnimatedLogo({
    this.animate = true,
    this.size,
    this.color,
  });

  final bool animate;
  final double? size;
  final Color? color;

  @override
  State<StatefulWidget> createState() => _EdenAnimatedLogo();
}

class _EdenAnimatedLogo extends State<QwivaAnimatedLogo>
    with TickerProviderStateMixin {
  late AnimationController animation;
  late Animation<double> _fadeInEdenAnimatedLogoOut;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
    _fadeInEdenAnimatedLogoOut =
        Tween<double>(begin: 0.0, end: 0.8).animate(animation);

    if (widget.animate) {
      animation.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animation.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animation.forward();
        }
      });
    }
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _fadeInEdenAnimatedLogoOut,
        child: SvgPicture.asset(GlobalAssets.qwivaLogo),
      ),
    );
  }
}
