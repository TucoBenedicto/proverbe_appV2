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
  final String assets;
  //Ici pour ajouter le type string , il faut ajouter du code supplementiare , plus bas pour le caster.
  //Caster : changer de type.
  final List<String> idProverb;

  Proverb({this.idCountry, this.country, this.assets, this.idProverb});

  factory Proverb.fromJson(Map<String, dynamic> parsedJson) {
    var idProverbFromJson = parsedJson['idProverb'];
    //print(idProverbFromJson.runtimeType); //Connaitre le type "List<dynamic>"
    List<String> idProverbList = idProverbFromJson.cast<String>(); //on change le dynamic en "string" grace a "cast"

    return new Proverb(
      idCountry: parsedJson["idCountry"].toString(),
     // idCountry: parsedJson["idCountry"],
      country: parsedJson["country"],
      assets: parsedJson["assets"],
      // idProverb: parsedJson["idProverb"],
      idProverb: idProverbList,
    );
  }
}

//Correction juste
/*

class SentenceList {
  final List<Sentence> sentences;
  SentenceList({
    this.sentences,
  });
  factory SentenceList.fromJson(List<dynamic> parsedJson) {
    List<Sentence> sentences = [];
    sentences = parsedJson.map((i) => Sentence.fromJson(i)).toList();
    return new SentenceList(sentences: sentences);
  }
}

class Sentence {
  final String idName;
  final String name;
  final String assets;
  final List<String> sentence;

  Sentence({this.idName, this.name, this.assets, this.sentence});

  factory Sentence.fromJson(Map<String, dynamic> parsedJson) {
    var sentenceFromJson = parsedJson['sentence'];
    //print(sentenceFromJson.runtimeType);
    List<String> sentenceList = sentenceFromJson.cast<String>();

    return Sentence(
      idName: parsedJson["idName"].toString(),
      name: parsedJson["name"],
      assets: parsedJson["assets"],
      sentence: sentenceList,
    );
  }
}
 */