import 'dart:math';
import 'package:ecomarket/screens/publicacion.dart';
import 'package:flip_card/flip_card.dart';
import 'package:ecomarket/screens/registro.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ListaCompra extends StatefulWidget {
  const ListaCompra({super.key});

  @override
  State<ListaCompra> createState() => _ListaCompraState();
}

class _ListaCompraState extends State<ListaCompra> {
  bool isBack1 = false;
  double angle1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFFFFFFFF),
              //Color(0xFFa3d5ee),
              Color.fromARGB(255, 13, 40, 53),
            ])),
        child: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardBoton(
                titulo: "Botellas transparentes",
                imagen: "images/transparentes.jpg",
                dir: "Quitumbe",
                rec: "Acuerdo con el comprador",
                peso: "250 KG",
              ),
              CardBoton(
                titulo: "Botellas transparentes",
                imagen: "images/transparentes.jpg",
                dir: "Plaza de Toros",
                rec: "Entrega a domicilio",
                peso: "100 KG",
              ),
              CardBoton(
                titulo: "Botellas de color",
                imagen: "images/color.jpg",
                dir: "La Mena 2",
                rec: "Recoger en el punto",
                peso: "1000 KG",
              ),
              CardBoton(
                titulo: "Tapas",
                imagen: "images/tapas.jpg",
                dir: "Calderon",
                rec: "Acuerdo con el comprador",
                peso: "25 KG",
              ),
              CardBoton(
                titulo: "Botellas mezcladas",
                imagen: "images/mezcla.jpg",
                dir: "La Pulida",
                rec: "Recoger en el punto",
                peso: "2500 KG",
              ),
              SizedBox(
                height: 80,
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

  void _navigateToPublicacion(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Publicacion()));
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
  const CardBoton(
      {super.key,
      required this.titulo,
      required this.imagen,
      required this.peso,
      required this.dir,
      required this.rec});

  final String titulo;
  final String imagen;
  final String peso;
  final String dir;
  final String rec;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        //height: MediaQuery.of(context).size.height / 3,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(imagen), fit: BoxFit.cover)),
            child: Card(
              color: const Color.fromARGB(170, 255, 255, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      titulo,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text(
                      peso,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      dir,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      rec,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Container(
                        width: 250,
                        child: const TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: "Oferta"),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 37, 99, 26),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "OFERTAR",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
