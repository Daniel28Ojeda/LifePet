import 'package:lifepet_app/models/pet_model.dart';

class PetService {
  final List<Pet> _petList = [];

  static final PetService _singleton = PetService._internal();
//singleton verifica se existe uma instancia do serviço ativa e retorna ela, caso não exista, ele cria

  factory PetService(){
    return _singleton;
  }

  PetService._internal() {
    _petList.add(
      Pet(
          nome: "Lisana",
          imageUrl: 'assets/images/lili.jpg',
          descricao: "Uma gata fujona",
          idade: 5,
          sexo: "Femea",
          cor: "cinza",
          bio: "medrosa",
          id: "1"
      ),
    );
    _petList.add(
        Pet(
          nome: "Ace",
          imageUrl: 'assets/images/ace.jpg',
          descricao: "Um gato sem vergonha",
          idade: 5,
          sexo: "Macho",
          cor: "Branco",
          bio: "comilao",
          id: "2"
    ),
    );
  }

  List getAllPets() {
    return _petList;
  }

  void addPet(Pet pet){
    _petList.add(Pet(
      nome: pet.nome,
      bio: pet.bio,
      idade: pet.idade,
      sexo: pet.sexo,
      descricao: pet.descricao,
      cor: pet.cor,
      imageUrl: 'assets/images/ace.jpg',
      id: pet.id,
    ));
  }

  Pet getPet(String id){
    return _petList.singleWhere((pet) {
      return pet.id == id;
    });
  }
}