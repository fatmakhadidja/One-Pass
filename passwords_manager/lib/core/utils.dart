import 'package:flutter/material.dart';
import 'package:passwords_manager/theme/theme_constants.dart';


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


class PasswordContainer extends StatelessWidget {
  final int number;
  final String text;
  const PasswordContainer({
    super.key,
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        color: Color(0xffF1F1F1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                '$number',
                style: TextStyle(
                  color: primaryColor,
                  fontFamily: 'BabasNeue',
                  fontSize: 64,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  '$text',
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
