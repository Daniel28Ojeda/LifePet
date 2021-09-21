import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/screens/form_pet_screen.dart';
import 'package:lifepet_app/screens/pet/perfil_pet_screen.dart';
import 'package:lifepet_app/services/pet_services.dart';

class HomeScreen extends StatelessWidget {
  PetService service = PetService();
  List<Pet> pets = [];

  HomeScreen() {
    _getAllPets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        //construtor
        itemCount: pets.length,
        itemBuilder: (context, index) {
          return _petCard(context, index);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //navegar entra paginas
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => FormPetScreen(),
            ),
          );
        },
        label: Text("Cadastrar"),
        icon: Icon(Icons.pets),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  //função que será repetida para cada item
  Widget _petCard(BuildContext context, int index) {
    return GestureDetector(
      //GestureDetector identifica alguma ação na tela
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => PerfilPetScreen(
              id: pets[index].id,
            ),
          ),
        );
      },
      //1 clique
      child: Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //faz as informações serem exibidas no início da coluna
            children: [
              Hero(
                //cria o efeito de transição entre as páginas
                tag: pets[index].id,
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)
                          //efeito de bordas arredondadas na imagem
                          ),
                      image: DecorationImage(
                          image: AssetImage(pets[index].imageUrl),
                          fit: BoxFit.cover)),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 40, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      pets[index].nome,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 40, 0),
                child: Text(
                  pets[index].descricao,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: Colors.grey),
                ),
              )
            ],
          )),
    );
  }

  void _getAllPets() {
    List<Pet>? list = service.getAllPets().cast<Pet>();
    pets = list;
  }
}
