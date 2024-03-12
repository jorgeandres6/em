import 'dart:io';

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
                    /* const Text(
                      "Publicación de nuevo producto",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ), */
                    Text(
                      widget.categoria,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    Container(
                      width: 250,
                      child: const TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Cantidad del producto en kilogramos"),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 13, 40, 53),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(color: Colors.white)),
                          child: ClipRRect(
                            child: Image(
                              image: AssetImage(widget.imagen),
                              //fit: BoxFit.cover,
                            ),
                          ),
                        ),
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
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 13, 40, 53)
                      /*  gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0XFF8A2387),
                            Color(0XFFE94057),
                            Color(0XFFF27121)
                          ]) */
                      ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Publicar",
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
