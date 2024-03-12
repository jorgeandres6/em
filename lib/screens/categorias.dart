import 'dart:math';
import 'package:ecomarket/screens/publicar.dart';
import 'package:flip_card/flip_card.dart';
import 'package:ecomarket/screens/registro.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Categorias extends StatefulWidget {
  const Categorias({super.key});

  @override
  State<Categorias> createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  bool isBack1 = false;
  double angle1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xFFFFFFFF),
                //Color(0xFFa3d5ee),
                Color.fromARGB(255, 13, 40, 53),
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              const SizedBox(
                height: 10,
              ),
              FlipCard(
                direction: FlipDirection.HORIZONTAL,
                side: CardSide.FRONT,
                front: const CardBoton(
                  titulo: "Botellas transparentes",
                  imagen: "images/transparentes.jpg",
                ),
                back: BackCard(
                    titulo: "Botellas transparentes",
                    desc:
                        "Solo botellas de plástico transparentes sin ningún color",
                    voidCallback: () {
                      _navigateToNextScreen(context, "Botellas transparentes",
                          "images/transparentes.jpg");
                    }),
              ),
              /*  const SizedBox(
                height: 20,
              ), */
              FlipCard(
                direction: FlipDirection.HORIZONTAL,
                side: CardSide.FRONT,
                front: const CardBoton(
                  titulo: "Botellas de color",
                  imagen: "images/color.jpg",
                ),
                back: BackCard(
                    titulo: "Botellas de color",
                    desc: "Botellas de plástico de uno o varios colores",
                    voidCallback: () {
                      _navigateToNextScreen(
                          context, "Botellas de color", "images/color.jpg");
                    }),
              ),
              /* const SizedBox(
                height: 20,
              ), */
              FlipCard(
                direction: FlipDirection.HORIZONTAL,
                side: CardSide.FRONT,
                front: const CardBoton(
                  titulo: "Botellas mezcladas",
                  imagen: "images/mezcla.jpg",
                ),
                back: BackCard(
                    titulo: "Botellas mezcladas",
                    desc:
                        "Botellas de plástico de colores y transparentes mezcladas",
                    voidCallback: () {
                      _navigateToNextScreen(
                          context, "Botellas mezcladas", "images/mezcla.jpg");
                    }),
              ),
              /*  const SizedBox(
                height: 20,
              ), */
              FlipCard(
                direction: FlipDirection.HORIZONTAL,
                side: CardSide.FRONT,
                front: const CardBoton(
                  titulo: "Tapas",
                  imagen: "images/tapas.jpg",
                ),
                back: BackCard(
                    titulo: "Tapas",
                    desc: "Tapas plásticas de botellas",
                    voidCallback: () {
                      _navigateToNextScreen(
                          context, "Tapas", "images/tapas.jpg");
                    }),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToNextScreen(
      BuildContext context, String contexto, String imagen) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Publicar(
              categoria: contexto,
              imagen: imagen,
            )));
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
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 4,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Card(
            color: const Color.fromARGB(255, 13, 40, 53),
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
                    onPressed: voidCallback,
                    child: const Text(
                      "Publicar",
                      style: TextStyle(color: Color.fromARGB(255, 13, 40, 53)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* void _navigateToNextScreen(
      BuildContext context, String contexto, String imagen) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Publicar(
              categoria: contexto,
              imagen: imagen,
            )));
  } */
}

class CardBoton extends StatelessWidget {
  const CardBoton({super.key, required this.titulo, required this.imagen});

  final String titulo;
  final String imagen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3.5,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          color: const Color.fromARGB(137, 13, 40, 53),
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
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      titulo,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
