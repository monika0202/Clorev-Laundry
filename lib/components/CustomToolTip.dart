import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class CustomToolTip extends StatelessWidget {
  final Widget content;
  final JustTheController tooltipController;
  CustomToolTip(
      {Key? key, required this.content, required this.tooltipController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedAlign(
        duration: const Duration(seconds: 1),
        alignment: Alignment.center,
        child: JustTheTooltip(
          triggerMode: TooltipTriggerMode.tap,
          onShow: () {
            // print('onShow');
          },
          onDismiss: () {},
          backgroundColor: Colors.black87.withOpacity(0.8),
          controller: tooltipController,
          // tailLength: length,
          tailBaseWidth: 20.0,
          isModal: true,
          preferredDirection: AxisDirection.up,
          //margin: margin,
          borderRadius: BorderRadius.circular(8.0),
          offset: 0,
          child: Icon(
            Icons.info_outline_rounded,
            color: bluegradientstartColor,
            size: 17,
          ),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200.0),
                child: content),
          ),
        ),
      ),
    );
  }
}
