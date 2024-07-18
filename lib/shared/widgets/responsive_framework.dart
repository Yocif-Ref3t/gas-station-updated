import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

// ignore: must_be_immutable
class ResponsineWrapper extends StatelessWidget {
  ResponsineWrapper({super.key, this.child});
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      breakpoints: [
        const Breakpoint(start: 0, end: 400, name: "SMALLMOBILE"),
        const Breakpoint(start: 401, end: 600, name: MOBILE),
        const Breakpoint(start: 601, end: 1200, name: TABLET),
        const Breakpoint(start: 1201, end: 1920, name: DESKTOP),
        const Breakpoint(start: 1921, end: 4096, name: '4K'),
      ],
      child: Builder(builder: (context) {
        return ResponsiveScaledBox(
            width: ResponsiveValue<double?>(
                defaultValue: 450,
                context,
                conditionalValues: [
                  const Condition.equals(name: "SMALLMOBILE", value: 450),
                  const Condition.equals(name: MOBILE, value: 490),
                  const Condition.equals(name: TABLET, value: 1200),
                  const Condition.equals(name: DESKTOP, value: 1900),
                  const Condition.equals(name: "4K", value: 2300),
                  // There are no conditions for width over 1200
                  // because the `maxWidth` is set to 1200 via the MaxWidthBox.
                ]).value,
            child: child!);
      }),
    );
  }
}
