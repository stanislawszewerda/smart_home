import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/app/features/home/menu_drawer/menu_drawer.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: [
              Text('Smart Home', style: GoogleFonts.lobster(fontSize: 30)),
              Text('Just for you', style: GoogleFonts.lobster(fontSize: 10)),
            ],
          ),
        ),
        // Drawer najprawdopodobniej nada się do wyekstraktowania jako osobny widget bo zajmie dużo miejsca!!!!!!
        /// Pomysły do zrobienia:
        /// Trzeba sprobować dodać Drawer jako osoby widget który będzie można wstawić na dowolnej stronie!!!
        /// Rozwijane menu Home? Po rozwinieciu przechodzimy do home a następnie z rozsuniętego home wybieramy to samo co z appbara?
        drawer: const MenuDrawer(),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Shop Page', style: GoogleFonts.lobster()),
            Text('This functionality will be avaliable in the future',
                style: GoogleFonts.lobster())
          ]),
        ));
  }
}
