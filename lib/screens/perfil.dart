import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

TextEditingController _dir =
    TextEditingController(text: "Naciones Unidas N45-32 y Amazonas");

TextEditingController _tel = TextEditingController(text: "0964567845");

TextEditingController _numCuenta = TextEditingController(text: "2276544387");

class _PerfilState extends State<Perfil> {
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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      'images/rostro.jpg',
                      height: 100,
                      width: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Juan Mendoza",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "1774829467",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "juanito@gmail.com",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
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
                      "Datos Personales",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _tel,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: "Teléfono",
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _dir,
                        decoration: const InputDecoration(
                          labelText: "Dirección",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _numCuenta,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: "Cuenta Bancaria"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButton(
                      hint: const Text('Banco Pichincha'),
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
                      hint: const Text('Ahorros'),
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
                      "Actualizar",
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
