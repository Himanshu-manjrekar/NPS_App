import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Radiorating<T> extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final value;
  final T? groupValue;
  final String label;
  final ValueChanged<T?> onChanged;
  final bool border;
  final Color bgcolor;
  final Function callbackFunction;

  // ignore: use_key_in_widget_constructors
  const Radiorating({
    required this.bgcolor,
    required this.border,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.onChanged,
    required this.callbackFunction,
  });

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final bool isSelected = value == groupValue;
    return Expanded(
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        onTap: () => {
          onChanged(value),
          callbackFunction(int.parse(value)),
        },
        child: Column(
          children: [
            Text(
              value.toString(),
              style: const TextStyle(
                color: Color(0xff002247),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: currentWidth > 1024
                  ? 8.6.w
                  : 8.w, // Resize this for responsive behaviour
              height: 22, // this is the size of the btn
              decoration: ShapeDecoration(
                shape: CircleBorder(
                  side: BorderSide(
                    color: isSelected ? bgcolor : const Color(0xffd7d9da),
                  ),
                ),
                color: isSelected ? bgcolor : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
