/// Ce fichier définit un modèle de données pour les régimes alimentaires
/// dans une application Flutter.
///
/// Il contient une classe `DietModel` qui représente un régime alimentaire
/// avec des informations comme :
/// - le nom du régime,
/// - le chemin de l'icône associée,
/// - le niveau de difficulté,
/// - la durée,
/// - les calories,
/// - et un indicateur pour savoir si le régime est sélectionné.
///
/// La méthode statique `getDiets()` crée une liste d'exemples de régimes
/// alimentaires avec des valeurs déjà définies. Cela permet de gérer
/// facilement les données des régimes dans l'application.
library;

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.viewIsSelected,
  });

  static List<DietModel> getDiets() {
    // Cette ligne veut dire que on va créer une liste de DietModel et que cette liste va s'appeler getDiets
    List<DietModel> diets = []; // On crée une liste vide de DietModel

    diets.add(
      DietModel(
        name: 'Hunry food',
        iconPath: 'lib/assets/images/magnifier.png',
        level: 'easy',
        duration: '30min',
        calories: '180kcal',
        viewIsSelected: true,
      ),
    );

    diets.add(
      DietModel(
        name: 'Hunry food',
        iconPath: 'lib/assets/images/magnifier.png',
        level: 'easy',
        duration: '30min',
        calories: '180kcal',
        viewIsSelected: true,
      ),
    );

    diets.add(
      DietModel(
        name: 'Hunry food',
        iconPath: 'lib/assets/images/magnifier.png',
        level: 'easy',
        duration: '30min',
        calories: '180kcal',
        viewIsSelected: true,
      ),
    );

    diets.add(
      DietModel(
        name: 'Hunry food',
        iconPath: 'lib/assets/images/magnifier.png',
        level: 'easy',
        duration: '30min',
        calories: '180kcal',
        viewIsSelected: true,
      ),
    );
    return diets;
  }
}
