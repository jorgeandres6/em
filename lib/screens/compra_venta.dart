import 'package:ecomarket/screens/contenedor.dart';
import 'package:ecomarket/screens/perfil.dart';
import 'package:ecomarket/screens/registro.dart';
import 'package:flutter/material.dart';

class CompraVenta extends StatelessWidget {
  const CompraVenta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
          /* decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xFF8A2387),
                Color(0xFFE94057),
                Color(0xFFF27121),
              ])), */
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              /*  GestureDetector(
                onTap: () {
                  _navigateToNextScreenVenta(context);
                },
                child: const CardBoton(
                  titulo: "Vender",
                  imagen: "images/venta.jpg",
                ),
              ), */
              GestureDetector(
                onTap: () {
                  _navigateToNextScreenVenta(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 2 - 100,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 20.0,
                        spreadRadius: 0.0,
                        offset: Offset(2.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(255, 13, 40, 53),
                    /* gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            //Color(0xFFa3d5ee),
                            Color(0xFFFFFFFF),
                            Color.fromARGB(255, 13, 40, 53),
                          ]) */
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Vender",
                      style: TextStyle(
                          color: Colors.white,
                          //color: Color.fromARGB(255, 13, 40, 53),
                          fontSize: 80,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              /* GestureDetector(
                onTap: () {
                  _navigateToNextScreenCompra(context);
                },
                child: const CardBoton(
                  titulo: "Comprar",
                  imagen: "images/compra.jpg",
                ),
              ), */
              GestureDetector(
                onTap: () {
                  _navigateToNextScreenCompra(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 2 - 100,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 20.0,
                        spreadRadius: 0.0,
                        offset: Offset(2.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    /*  gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            //Color(0xFFa3d5ee),
                            Color.fromARGB(255, 13, 40, 53),
                            Color(0xFFFFFFFF),
                          ]) */
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Comprar",
                      style: TextStyle(
                          color: Color.fromARGB(255, 13, 40, 53),
                          fontSize: 80,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              /* GestureDetector(
                onTap: () {
                  _navigateToPerfil(context);
                },
                child: const CardBoton(
                  titulo: "Mi perfil",
                  imagen: "images/perfil.jpg",
                ),
              ),
              const SizedBox(
                height: 30,
              ), */
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToNextScreenVenta(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Contenedor(
              venta: true,
            )));
  }

  void _navigateToNextScreenCompra(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Contenedor(
              venta: false,
            )));
  }

  /*  void _navigateToPerfil(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Perfil(
              appbarV: true,
            )));
  } */
}

class CardBoton extends StatelessWidget {
  const CardBoton({super.key, required this.titulo, required this.imagen});

  final String titulo;
  final String imagen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 4,
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
                child: Text(
                  titulo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 50),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
