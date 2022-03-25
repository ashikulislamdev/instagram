import 'package:flutter/material.dart';

class SimOperate extends StatelessWidget {
  final String title;
  final String simNo;
  final String operator;
  const SimOperate({
    Key? key,
    required this.title,
    required this.simNo,
    required this.operator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Icon(Icons.sim_card_rounded, size: 12,),
              Text(simNo,  style: const TextStyle(fontWeight: FontWeight.w300),)
            ],
          ),
          Text(operator, style: const TextStyle(fontWeight: FontWeight.w300),),
        ],
      ),
    );
  }
}
