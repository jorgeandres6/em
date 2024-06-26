import 'dart:math';
import 'package:ecomarket/screens/categorias.dart';
import 'package:ecomarket/screens/compra_venta.dart';
import 'package:ecomarket/screens/home.dart';
import 'package:ecomarket/screens/lista_compra.dart';
import 'package:ecomarket/screens/login.dart';
import 'package:ecomarket/screens/perfil.dart';
import 'package:ecomarket/screens/publicaciones.dart';
import 'package:ecomarket/screens/publicar.dart';
import 'package:flip_card/flip_card.dart';
import 'package:ecomarket/screens/registro.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Contenedor extends StatefulWidget {
  const Contenedor({super.key, required this.venta});

  final bool venta;

  @override
  State<Contenedor> createState() => _ContenedorState();
}

class _ContenedorState extends State<Contenedor> {
  bool isBack1 = false;
  double angle1 = 0;
  int _currentIndex = 0;
  final _pageOprtions = const [
    Categorias(),
    Perfil(
      appbarV: false,
    ),
    Publicaciones(),
    Categorias()
  ];

  final _pageOprtions2 = const [
    ListaCompra(),
    Perfil(
      appbarV: false,
    ),
    Publicaciones(),
    ListaCompra()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.white,
          ),
          title: const Text("Categorias",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          backgroundColor: const Color.fromARGB(255, 13, 40, 53),
          centerTitle: true,
          /* bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.settings),
            )
          ]), */
        ),
        bottomNavigationBar: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
              width: MediaQuery.of(context).size.width - 50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: GNav(
                //duration: const Duration(microseconds: 600),
                //tabBorderRadius: 10,
                curve: Curves.elasticIn,
                //gap: 8,
                onTabChange: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                backgroundColor: Colors.grey,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.grey.shade800,
                padding: const EdgeInsets.all(10),
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    //text: "Inicio",
                  ),
                  GButton(
                    icon: Icons.account_circle,
                    //text: "Perfil",
                  ),
                  GButton(
                    icon: Icons.view_list,
                    //text: "Publicaciones",
                  ),
                  GButton(
                    icon: Icons.notifications,
                    //text: "Notificaciones",
                  ),
                ],
              ),
            ),
          ),
        ),
        body: widget.venta
            ? _pageOprtions[_currentIndex]
            : _pageOprtions2[_currentIndex]);
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Registro()));
  }

  double flip(angle) {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
    return angle;
  }
}

class BackCard extends StatelessWidget {
  const BackCard(
      {super.key,
      required this.titulo,
      required this.desc,
      required this.voidCallback});

  final String titulo;
  final String desc;
  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          color: const Color.fromARGB(255, 19, 9, 159),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                titulo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 12,
                ),
                child: SingleChildScrollView(
                  child: Text(desc,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white)),
                ),
              ),
              ElevatedButton(
                  onPressed: voidCallback, child: const Text("Publicar"))
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Registro()));
  }
}

class CardBoton extends StatelessWidget {
  const CardBoton({super.key, required this.titulo, required this.imagen});

  final String titulo;
  final String imagen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          color: const Color.fromARGB(170, 255, 255, 255),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4 - 50,
                  width: double.infinity,
                  child: Image(
                    image: AssetImage(imagen),
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                    //padding: const EdgeInsets.all(10),
                    child: Text(
                  titulo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
