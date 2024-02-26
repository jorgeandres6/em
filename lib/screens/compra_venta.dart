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
              GestureDetector(
                onTap: () {
                  _navigateToNextScreen(context);
                },
                child: const CardBoton(
                  titulo: "Vender",
                  imagen: "images/venta.jpg",
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  _navigateToNextScreen(context);
                },
                child: const CardBoton(
                  titulo: "Comprar",
                  imagen: "images/compra.jpg",
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  _navigateToNextScreen(context);
                },
                child: const CardBoton(
                  titulo: "Mi perfil",
                  imagen: "images/perfil.jpg",
                ),
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
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(imagen), fit: BoxFit.cover)),
          child: Card(
            color: const Color.fromARGB(170, 255, 255, 255),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                titulo,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
