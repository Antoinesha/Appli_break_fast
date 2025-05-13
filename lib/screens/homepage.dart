import 'package:breakfast/models/category_model.dart';
import 'package:breakfast/models/die_model.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  List<CategoryModel> categories = [];
  List<DietModel> diets = [];

  // cette methode permet de recuperer les categories
  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getdiets() {
    diets = DietModel.getDiets();
  }

  // cette methode permet de recuperer les categories et les diets
  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();

    @override
    void initState() {
      _getCategories();
    }
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      // Ici c'est le widget qui permet de créer une barre d'application qui est en haut de l'écran
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchField(),
          SizedBox(height: 40),
          _categoriesSection(),
          SizedBox(height: 20),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Recommendation\nfor Diet',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 120,

          //color: Colors.green,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(width: 15),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(categories[index].iconPath),
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: EdgeInsets.only(
        top: 40,
        left: 20,
        right: 20,
      ), // Ici c'est le widget qui permet de créer un conteneur qui s'affiche en haut de l'écran
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextField(
        // Dans ce textfield nous allons mettre
        //les icones, images de la recherche et du filtrage
        decoration: InputDecoration(
          filled: true, // Ici c'est la couleur de fond du champ de texte
          fillColor:
              Colors.white, // Ici c'est la couleur de fond du champ de texte
          contentPadding: EdgeInsets.all(15),
          hintText: 'Search pancake',
          hintStyle: TextStyle(color: Color(0xffDDDADA), fontSize: 14),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            // insertion de l'icon de la recherche
            child: Image.asset(
              'lib/assets/images/magnifier.png',
              height: 10,
              width: 10,
            ),
          ),
          // Insertion de l'icon du filtrage
          suffixIcon: Container(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.1,
                  ),
                  Padding(
                    // Ici le suffixIcon permet de mettre les elements a la fin
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      'lib/assets/images/slider.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        // Ici c'est le texte qui s'affiche dans la barre d'application
        'Breakfast',
        // Ici c'est le style du texte qui s'affiche dans la barre d'application
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          //fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.green,
      elevation: 0.0, // Ici c'est l'ombre de la barre d'application

      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Image.asset(
            'lib/assets/images/left-arrow.png',
            height: 15,
            width: 15,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),

      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            // Ici c'est le widget qui permet de créer un bouton qui s'affiche dans la barre d'application
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Image.asset(
              'lib/assets/images/back.png',
              height: 25,
              width: 25,
            ),
            // height: 45,
            // width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
