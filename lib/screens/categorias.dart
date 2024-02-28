import 'dart:math';
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
      /* appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text("Categorias",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 34, 33, 91),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: GNav(
            //duration: const Duration(microseconds: 600),
            //tabBorderRadius: 10,
            curve: Curves.elasticIn,
            gap: 8,
            onTabChange: (index) {
              print(index);
            },
            backgroundColor: Colors.grey,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            padding: const EdgeInsets.all(10),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Inicio",
              ),
              GButton(
                icon: Icons.account_circle,
                text: "Perfil",
              ),
              GButton(
                icon: Icons.view_list,
                text: "Publicaciones",
              ),
              GButton(
                icon: Icons.notifications,
                text: "Notificaciones",
              ),
            ],
            /*  bottom: false,
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.blueGrey, borderRadius: BorderRadius.circular(24)),
              child: const Row(children: [
                SizedBox(
                  height: 36,
                  width: 36,
                  // child:
                )
              ]),
            ), */
          ),
        ),
      ), */
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
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
                      _navigateToNextScreen(context);
                    }),
              ),
              const SizedBox(
                height: 30,
              ),
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
                      _navigateToNextScreen(context);
                    }),
              ),
              const SizedBox(
                height: 30,
              ),
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
                      _navigateToNextScreen(context);
                    }),
              ),
              const SizedBox(
                height: 30,
              ),
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
                      _navigateToNextScreen(context);
                    }),
              ),
              const SizedBox(
                height: 30,
              ),
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
