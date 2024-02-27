import 'package:flutter/material.dart';

class Publicar extends StatefulWidget {
  const Publicar({super.key});

  @override
  State<Publicar> createState() => _PublicarState();
}

class _PublicarState extends State<Publicar> {
  final List<String> _locations = [
    "Banco Pichincha",
    "Produbanco",
    "Banco Internacional",
    "Banco Guayaquil",
    "Banco Bolivariano",
    "BIESS"
  ];
  String? _selectedLocation;

  final List<String> _cuenta = [
    "Ahorros",
    "Corriente",
  ];
  String? _selectedCuenta;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text("Registro",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 34, 33, 91),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 9, 16, 69),
                Color.fromARGB(255, 34, 33, 91),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              /* const Text(
                "REGRISTRO",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ), */
              Container(
                // height: 700,
                width: 320,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Por favor, ingrese sus datos",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: const TextField(
                        decoration: InputDecoration(
                          labelText: "Nombre",
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: const TextField(
                        decoration: InputDecoration(
                          labelText: "Apellido",
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: const TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Celular",
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: const TextField(
                        decoration: InputDecoration(
                          labelText: "Dirección",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: const TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                            InputDecoration(labelText: "Correo electrónico"),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(labelText: "Contraseña"),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: const TextField(
                        obscureText: true,
                        decoration:
                            InputDecoration(labelText: "Repetir contraseña"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: const TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Número de cuenta bancaria"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButton(
                      hint: const Text('Elija el banco'),
                      value: _selectedLocation,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedLocation = newValue;
                        });
                      },
                      items: _locations.map((location) {
                        return DropdownMenuItem(
                          value: location,
                          child: Text(location),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButton(
                      hint: const Text('Elija el tipo de cuenta'),
                      value: _selectedCuenta,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCuenta = newValue;
                        });
                      },
                      items: _cuenta.map((cuenta) {
                        return DropdownMenuItem(
                          value: cuenta,
                          child: Text(cuenta),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0XFF8A2387),
                            Color(0XFFE94057),
                            Color(0XFFF27121)
                          ])),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Registrarse",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
