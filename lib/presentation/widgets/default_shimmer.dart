import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DefaultShimmer extends StatelessWidget {
  final Widget child;
  final bool isShimmerVisible;

  const DefaultShimmer({
    super.key,
    required this.child,
    required this.isShimmerVisible,
  });

  @override
  Widget build(BuildContext context) {
    return isShimmerVisible
        ? IgnorePointer(
            ignoring: isShimmerVisible,
            child: Shimmer.fromColors(
              loop: 100,
              period: const Duration(seconds: 1),
              direction: ShimmerDirection.ltr,
              baseColor: const Color(0xFFCFD0D2),
              highlightColor: const Color(0xFFF5F5F6),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFCFD0D2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: child,
              ),
            ),
          )
        : child;
  }
}
