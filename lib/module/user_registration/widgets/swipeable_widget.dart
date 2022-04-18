import 'package:flutter/material.dart';

class SwipeableWidget extends StatefulWidget {
  final Widget child;
  final double height;
  final VoidCallback onSwipeCallback;

  final bool isActive;
  final double swipePercentageNeeded;

  const SwipeableWidget(
      {Key? key,
      required this.child,
      required this.height,
      required this.onSwipeCallback,
      this.swipePercentageNeeded = 0.75,
      required this.isActive})
      : assert(swipePercentageNeeded <= 1.0),
        super(key: key);

  @override
  _SwipeableWidgetState createState() => _SwipeableWidgetState();
}

class _SwipeableWidgetState extends State<SwipeableWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  var _dxStartPosition = 0.0;
  var _dxEndsPosition = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      });

    _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onPanStart: (details) {
          if (widget.isActive) {
            setState(() {
              _dxStartPosition = details.localPosition.dx;
            });
          }
        },
        onPanUpdate: (details) {
          if (widget.isActive) {
            final widgetSize = context.size!.width;
            final minimumXToStartSwiping = widgetSize * 0.25;
            if (_dxStartPosition <= minimumXToStartSwiping) {
              setState(() {
                _dxEndsPosition = details.localPosition.dx;
              });
              final widgetSize = context.size!.width;
              _controller.value = 1 - ((details.localPosition.dx) / widgetSize);
            }
          }
        },
        onPanEnd: (details) async {
          if (widget.isActive) {
            final delta = _dxEndsPosition - _dxStartPosition;
            final widgetSize = context.size!.width;
            final deltaNeededToBeSwiped =
                widgetSize * widget.swipePercentageNeeded;
            if (delta > deltaNeededToBeSwiped) {
              _controller.animateTo(0.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn);
              widget.onSwipeCallback();
            } else {
              _controller.animateTo(1.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn);
            }
          }
        },
        child: SizedBox(
          height: widget.height,
          child: Align(
            alignment: Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: _controller.value,
              heightFactor: 1.0,
              child: widget.child,
            ),
          ),
        ));
  }
}
