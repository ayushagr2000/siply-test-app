import 'package:flutter/material.dart';
import 'package:siply/module/user_registration/widgets/swipeable_widget.dart';

/// A Button that can detect swiping movement with shimmering arrows on far end.
class SwipingButton extends StatelessWidget {
  /// The text that the button will display.
  final String text;
  final String backgroundText;
  final Color activeColor;
  final bool isActive;

  /// The callback invoked when the button is swiped.
  final VoidCallback onSwipeCallback;

  const SwipingButton({
    Key? key,
    required this.text,
    required this.onSwipeCallback,
    required this.backgroundText,
    required this.activeColor,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Stack(
        children: <Widget>[
          Container(
            height: 60.0,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                )),
            child: _buildText(backgroundText),
          ),
          SwipeableWidget(
            isActive: isActive,
            swipePercentageNeeded: 0.6,
            height: 60.0,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: _buildContent(),
              ),
              height: 80.0,
              decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  )),
            ),
            onSwipeCallback: onSwipeCallback,
          ),
        ],
      ),
    );
  }

  Widget _buildText(String textTitle) {
    const textStyle = TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);
    return Flexible(
      flex: 2,
      child: Center(
        child: Text(
          textTitle,
          style: textStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildText(text),
      ],
    );
  }
}
