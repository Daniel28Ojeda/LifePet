import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/screens/home_screen.dart';
import 'package:lifepet_app/services/pet_services.dart';

class FormPetScreen extends StatefulWidget {
  @override
  _FormPetScreenState createState() => _FormPetScreenState();
}

class _FormPetScreenState extends State<FormPetScreen> {
  String? corPet = 'Branco';
  String? sexoPet = 'Macho';
  final _nomeController = TextEditingController();
  final _bioController = TextEditingController();
  final _idadeController = TextEditingController();
  final _descricaoController = TextEditingController();
  PetService service = PetService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro do pet"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _nomeController,
                  //tipo de teclado q vai abrir
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration( labelText: "Nome do pet"),
                ),
                TextFormField(
                  controller: _bioController,
                  //tipo de teclado q vai abrir
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration( labelText: "Bio"),
                ),
                TextFormField(
                  controller: _idadeController,
                  //tipo de teclado q vai abrir
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration( labelText: "Idade"),
                ),
                DropdownButtonFormField(
                  value: sexoPet,
                  onChanged: (String? sexoSelecionado) {
                    setState(() {
                      sexoPet = sexoSelecionado;
                    });
                  },
                  items: <String>['Macho', 'Fêmea'].map<DropdownMenuItem<String>>
                    ((String value){
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value)
                    );
                  }).toList(),
                ),
                TextFormField(
                  controller: _descricaoController,
                  //tipo de teclado q vai abrir
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration( labelText: "Descrição"),
                ),
                DropdownButtonFormField(
                  value: corPet,
                  onChanged: (String? corSelecionada) {
                    setState(() {
                      corPet = corSelecionada;
                    });
                  },
                  items: <String>['Branco', 'Preto', 'Marrom', 'Amarelo'].map<DropdownMenuItem<String>>
                    ((String value){
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value)
                      );
                  }).toList(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        Pet newPet = Pet(
                          nome: _nomeController.text,
                          bio: _bioController.text,
                          idade: int.parse(_idadeController.text),
                          sexo: sexoPet.toString(),
                          descricao: _descricaoController.text,
                          cor: corPet.toString(),
                          id: Random().nextInt(100).toString(),
                          imageUrl: "",
                        );
                        service.addPet(newPet);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => HomeScreen(),
                          )
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent
                      ),
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
