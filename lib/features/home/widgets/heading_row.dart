import 'package:flutter/material.dart';
import 'package:polam/features/home/widgets/drawer_widget.dart';

class HeadingRow extends StatefulWidget {
  const HeadingRow({super.key});

  @override
  State<HeadingRow> createState() => _HeadingRowState();
}

class _HeadingRowState extends State<HeadingRow> {
  final Widget drawerWidget = const DrawerWidget();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        InkWell(
          onTap: () {
            drawerWidget;
            Scaffold.of(context).openDrawer();
          },
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 24,
            child: Image.asset(
              'Assets/Images/persona.jpg',
              width: 30,
              height: 30,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.25,
        ),
        Text(
          'Polam',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'SF Pro Display',
          ),
        ),
      ],
    );
  }
}
