import 'package:flutter/material.dart';


class CountButton extends StatefulWidget {
  final Color clr;
  final Function(int) onNext;
  final int index ;
  const CountButton({super.key,required this.onNext, required this.index,required this.clr});

  @override
  State<CountButton> createState() => _CountButtonState();
}

class _CountButtonState extends State<CountButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
                onPressed: () {
                  widget.onNext(widget.index-1);
                },
                child: Text(
                  '${widget.index}',
                  style: TextStyle(
                    color: widget.clr,
                    fontFamily: 'BabasNeue',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              );
  }
}