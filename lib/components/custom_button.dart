import 'package:flutter/material.dart';
import 'package:pixareo_test_task/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {this.title,
      this.icon,
      this.style,
      this.width,
      this.height,
      this.onPressed,
      Key? key})
      : super(key: key);
  final Function()? onPressed;
  final String? title;
  final double? height, width;
  final ButtonStyle? style;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    // В проекте не изменял размеры кнопки при помощи width и height полей,
    // но добавил их для наглядности, в случае чего размеры кнопки можно изменить на необходиме
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Constants.defaultPadding / 2),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          // У ElevatedButton нет поля цвет, но зато есть поле style, при
          // помощи его и будем изменять цвет кнопки
          style: style,
          onPressed: onPressed,
          child: icon != null && title != null
              ? Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      icon ?? SizedBox(),
                      SizedBox(
                        width: Constants.defaultPadding / 4,
                      ),
                      Text(
                        title ?? '',
                        style: TextStyle(
                          fontSize: Constants.mediumFontSize,
                          color: Constants.defaultFontColor,
                        ),
                      ),
                    ],
                  ),
                )
              : icon != null && title == null
                  ? Center(child: icon)
                  : icon == null && title != null
                      ? Center(child: Text(title ?? ''))
                      : SizedBox(),
        ),
      ),
    );
  }
}
