/*
class InterestsModel {
  //Field
  final int id;
  final String country;
  final String imageAsset;
  //Constructor
  InterestsModel(this.id, this.country, this.imageAsset);
}
 */

// Let’s make a PODO (Plain Old Dart Object?) file for this json structure.

class ProverbList {
  final List<Proverb> proverbs ;

  ProverbList({
    this.proverbs,
  });

  factory ProverbList.fromJson(List<dynamic> parsedJson) {
    List<Proverb> proverbs = [];
    //List<Proverb> proverbs;
    proverbs = parsedJson.map((i) => Proverb.fromJson(i)).toList();

    return ProverbList(proverbs: proverbs);
  }
}

class Proverb {
  final String idCountry;
  final String country;
  final String assetsIcon;
  final String assetsCanvas;
  //Ici pour ajouter le type string , il faut ajouter du code supplementiare , plus bas pour le caster.
  //Caster : changer de type.
  final List<String> idProverb;

  Proverb({this.idCountry, this.country, this.assetsIcon,this.assetsCanvas, this.idProverb});

  factory Proverb.fromJson(Map<String, dynamic> parsedJson) {
    var idProverbFromJson = parsedJson['idProverb'];
    //print(idProverbFromJson.runtimeType); //Connaitre le type "List<dynamic>"
    List<String> idProverbList = idProverbFromJson.cast<String>(); //on change le dynamic en "string" grace a "cast"

    return new Proverb(
      idCountry: parsedJson["idCountry"].toString(),
     // idCountry: parsedJson["idCountry"],
      country: parsedJson["country"],
      assetsIcon: parsedJson["assetsIcon"],
      assetsCanvas: parsedJson["assetsCanvas"],
      // idProverb: parsedJson["idProverb"],
      idProverb: idProverbList,
    );
  }
}