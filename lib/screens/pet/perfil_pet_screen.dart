import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/services/pet_services.dart';
import 'package:lifepet_app/widgets/custom_navbar.dart';

class PerfilPetScreen extends StatelessWidget {

  final String id;
  PetService service = PetService();
  Pet pet;

  PerfilPetScreen({required this.id}){
    _getPet(id);
  }

  //criação do contrutor das informações do pet
  Widget _cartaoInfoPet(String label, String informacao) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 100,
      decoration: BoxDecoration(
        color: Color(0xFFF8F2F7),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.red
            ),
          ),
          SizedBox(height: 8,),
          Text(
            informacao,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                        image: AssetImage(
                          pet.imageUrl
                        ),
                        fit: BoxFit.cover
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
            SizedBox( height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    pet.nome,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    pet.descricao,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        color: Colors.grey
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _cartaoInfoPet('Idade', pet.idade.toString()),
                  _cartaoInfoPet('Sexo', pet.sexo.toString()),
                  _cartaoInfoPet('Cor', pet.cor.toString()),
                  _cartaoInfoPet('Id', pet.id.toString())
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: Text(
                pet.bio,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  height: 1.5
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(
          Icons.edit,
        ),
        backgroundColor: Colors.redAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavBar(paginaAberta: 0,pet: pet),
    );
  }

  void _getPet(String id){
    pet = service.getPet(id);
  }
}
