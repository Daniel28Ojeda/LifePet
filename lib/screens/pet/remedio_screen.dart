import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/widgets/custom_navbar.dart';
import 'form_remedio_pet_screen.dart';

class RemedioScreen extends StatelessWidget {
  final Pet pet;
  RemedioScreen({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            //serve para empilar o bloco da imagem com os icones
            children: <Widget>[
              Hero(
                tag: pet.id,
                child: Container(
                  width: double.infinity,
                  //largura maxima da tela
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(pet.imageUrl), fit: BoxFit.cover
                        //incorpora a image ao box decoration
                        ),
                  ),
                ),
              ),
              //criar o botão voltar no topo em cima da imagem
              Padding(
                padding: EdgeInsets.only(top: 40, left: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Remédios",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Card(
                  elevation: 8.0,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Container(
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    width: 1.0, color: Colors.redAccent))),
                        child: Icon(Icons.healing, color: Colors.redAccent),
                      ),
                      title: Text(pet.nome,
                          style: TextStyle(fontWeight: FontWeight.w400)),
                      subtitle: Text(
                        pet.descricao,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => FormRemedioPetScreen(pet: pet,),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavBar(paginaAberta: 1,pet: pet),
      );
  }
}
