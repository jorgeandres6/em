import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Publicar extends StatefulWidget {
  const Publicar({super.key, required this.categoria, required this.imagen});

  final String categoria;
  final String imagen;

  @override
  State<Publicar> createState() => _PublicarState();
}

class _PublicarState extends State<Publicar> {
  final List<String> _locations = [
    "Entrega a domicilio",
    "Recogida el el lugar",
    "A convenir con el comprador",
  ];
  String? _selectedLocation;

  FilePickerResult? filePickerResult;
  File? pickedFile;

  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text("Publicación de nuevo producto",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 13, 40, 53),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
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
                    Text(
                      widget.categoria.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: const TextField(
                        decoration: InputDecoration(
                          labelText: "Dirección donde se ubica el producto",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButton(
                      hint: const Text('Tipo de entrega'),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Column(
                        children: [
                          const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "CANTIDAD DE PRODUCTO",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                          Container(
                            //padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              /* border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 13, 40, 53)) */
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Text(
                                    "En unidades",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                CupertinoSwitch(
                                  trackColor: Colors.blue,
                                  value: _switchValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _switchValue = value;
                                    });
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    "En kilogramos",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 250,
                      child: const TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: "Cantidad"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        width: 250,
                        child: const TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: "Precio total (Opcional)"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(255, 13, 40, 53),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                            height: MediaQuery.of(context).size.height,
                            //alignment: Alignment.center,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(widget.imagen),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: Colors.white))),
                      ),
                    ),
                    /* const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final result = await FilePicker.platform.pickFiles();
                        if (result == null) {
                          return;
                        } else {
                          final file = result.files.first;
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(file.path!)));
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromARGB(255, 13, 40, 53),
                          /*  gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0XFF8A2387),
                                  Color(0XFFE94057),
                                  Color(0XFFF27121)
                                ]) */
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: Colors.white)),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                  size: 60,
                                ),
                                Text(
                                  "Cargar fotografía del producto",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ), */
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.white, elevation: 5),
                onPressed: () {},
                child: const Text(
                  "Publicar",
                  style: TextStyle(
                      color: Color.fromARGB(255, 13, 40, 53),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              /* GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Publicar",
                      style: TextStyle(
                          color: Color.fromARGB(255, 13, 40, 53),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ), */
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
