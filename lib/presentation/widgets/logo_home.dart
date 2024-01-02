
import 'package:flutter/material.dart';


class LogoHome extends StatelessWidget {
  const LogoHome({
    super.key, 
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: size.height*.05),
      width: size.width,
      child: Center(
        child: Image.asset(
          'assets/img/logo_screen.png',
          width: size.width*.8,
          fit: BoxFit.cover,
        ),
      ),      
    );
  }
}