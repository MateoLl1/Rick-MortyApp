


import 'package:flutter/material.dart';


class FooterComponent extends StatelessWidget {
  const FooterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text('Developed by Mateo Ll',style: textStyle.titleSmall,)
      ),
    );
  }
}