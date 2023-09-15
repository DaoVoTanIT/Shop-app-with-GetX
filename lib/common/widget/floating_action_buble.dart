import 'package:flutter/material.dart';

class BubbleMenu extends StatelessWidget {
  const BubbleMenu({
    super.key,
    required this.title,
    required this.style,
    this.iconColor,
    required this.bubbleColor,
    this.icon,
    required this.onPressed,
  });

  final Icon? icon;
  final Color? iconColor;
  final Color bubbleColor;
  final void Function() onPressed;
  final String title;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const StadiumBorder(),
      padding: const EdgeInsets.only(top: 11, bottom: 13, left: 32, right: 32),
      color: bubbleColor,
      splashColor: Colors.grey.withOpacity(0.1),
      highlightColor: Colors.grey.withOpacity(0.1),
      elevation: 2,
      highlightElevation: 2,
      disabledColor: bubbleColor,
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          icon ?? Container(),
          SizedBox(
            width: icon == null ? 0 : 10,
          ),
          Text(
            title,
            style: style,
          ),
        ],
      ),
    );
  }
}

class _DefaultHeroTag {
  const _DefaultHeroTag();
  @override
  String toString() => '<default FloatingActionBubble tag>';
}

class FloatingActionBubble extends AnimatedWidget {
  const FloatingActionBubble({
    super.key,
    required this.items,
    required this.onPressed,
    required this.iconColor,
    required this.backgroundColor,
    required Animation<double> animation,
    this.separation = 12,
    this.heroTag,
    this.iconData,
    this.autoFocus = false,
    this.animatedIconData,
    this.shape,
    this.elevation,
    this.clipBehavior = Clip.none,
    this.disabledElevation,
    this.splashColor,
    this.hoverColor,
    this.focusColor,
    this.mouseCursor,
    this.hoverElevation,
    this.focusElevation,
    this.enableFeedback,
    this.isExtended = false,
    this.foregroundColor,
    this.focusNode,
    this.highlightElevation,
    this.materialTapTargetSize,
    this.mini = false,
    this.tooltip,
  })  : assert(
          (iconData == null && animatedIconData != null) ||
              (iconData != null && animatedIconData == null),
          'You must provide either iconData or animatedIconData, but not both',
        ),
        super(listenable: animation);

  final List<Widget> items;
  final void Function() onPressed;
  final AnimatedIconData? animatedIconData;
  final Object? heroTag;
  final IconData? iconData;
  final Color iconColor;
  final Color backgroundColor;
  final double separation;
  final ShapeBorder? shape;
  final bool autoFocus;
  final Clip clipBehavior;
  final double? elevation;
  final double? disabledElevation;
  final Color? splashColor;
  final Color? hoverColor;
  final Color? focusColor;
  final MouseCursor? mouseCursor;
  final double? hoverElevation;
  final double? focusElevation;
  final bool? enableFeedback;
  final bool isExtended;
  final Color? foregroundColor;
  final FocusNode? focusNode;
  final double? highlightElevation;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool mini;
  final String? tooltip;

  Animation<double> get _animation => listenable as Animation<double>;

  Widget itemBuilder(BuildContext context, int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textDirection = Directionality.of(context);
    final animationDirection = textDirection == TextDirection.ltr ? -1 : 1;

    final transform = Matrix4.translationValues(
      animationDirection *
          (screenWidth - _animation.value * screenWidth) *
          ((items.length - index) / 4),
      0,
      0,
    );

    return Align(
      alignment: textDirection == TextDirection.ltr
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Transform(
        transform: transform,
        child: Opacity(
          opacity: _animation.value,
          child: items[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IgnorePointer(
          ignoring: _animation.value == 0,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => SizedBox(height: separation),
            padding: EdgeInsets.symmetric(vertical: separation),
            itemCount: items.length,
            itemBuilder: itemBuilder,
          ),
        ),
        FloatingActionButton(
          heroTag: heroTag ?? const _DefaultHeroTag(),
          backgroundColor: backgroundColor,
          onPressed: onPressed,
          shape: shape,
          autofocus: autoFocus,
          clipBehavior: clipBehavior,
          elevation: elevation,
          splashColor: splashColor,
          hoverColor: hoverColor,
          focusColor: focusColor,
          mouseCursor: mouseCursor,
          hoverElevation: hoverElevation,
          focusElevation: focusElevation,
          enableFeedback: enableFeedback,
          isExtended: isExtended,
          foregroundColor: foregroundColor,
          focusNode: focusNode,
          highlightElevation: highlightElevation,
          materialTapTargetSize: materialTapTargetSize,
          mini: mini,
          tooltip: tooltip,
          disabledElevation: disabledElevation,
          child: iconData == null
              ? AnimatedIcon(
                  icon: animatedIconData!,
                  progress: _animation,
                  color: iconColor,
                )
              : Icon(
                  iconData,
                  color: iconColor,
                ),
        ),
      ],
    );
  }
}
