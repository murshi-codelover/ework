import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Widget endChild;

  const MyTimeLineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.endChild,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      //width: 200,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          color: isPast ? Colors.deepPurple : Colors.grey,
        ),
        indicatorStyle: IndicatorStyle(
          width: 30,
          iconStyle: IconStyle(iconData: Icons.done, color: Colors.white),
          color: isPast ? Colors.deepPurple : Colors.grey,
        ),
        endChild: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: endChild,
          ),
        ),
      ),
    );
  }
}
