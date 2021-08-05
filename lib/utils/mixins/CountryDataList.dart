import 'CountryModelClass.dart';

   List countrydata = [
    InterestsModel(0, 'Japonais', 'assets/logo/bonsai1.jpg'),
    InterestsModel(1, 'Senegalais', 'assets/logo/bonsai2.jpg'),
    InterestsModel(2, 'Random', 'assets/logo/bonsai3.jpg'),
    InterestsModel(3, 'American', 'assets/logo/bonsai4.jpg'),
    InterestsModel(4, 'Marocan', 'assets/logo/bonsai5.jpg')
  ];

class MyService {

  static final MyService _instance = MyService._internal();

  // passes the instantiation to the _instance object
  factory MyService() => _instance;

  //initialize variables in here
  MyService._internal() {

    List countrydata = [
      InterestsModel(0, 'Japonais', 'assets/logo/bonsai1.jpg'),
      InterestsModel(1, 'Senegalais', 'assets/logo/bonsai2.jpg'),
      InterestsModel(2, 'Random', 'assets/logo/bonsai3.jpg'),
      InterestsModel(3, 'American', 'assets/logo/bonsai4.jpg'),
      InterestsModel(4, 'Marocan', 'assets/logo/bonsai5.jpg')
    ];

  }

  //List countrydata;

  //short getter for my variable
  List get myVariable => countrydata;

  //short setter for my variable
  set myVariable(List value) => myVariable = value;

  //void incrementMyVariable() => countrydata++;
}




   /* SAVE
   import 'CountryModelClass.dart';

   List countrydata = [
    InterestsModel(0, 'Japonais', 'assets/logo/bonsai1.jpg'),
    InterestsModel(1, 'Senegalais', 'assets/logo/bonsai2.jpg'),
    InterestsModel(2, 'Random', 'assets/logo/bonsai3.jpg'),
    InterestsModel(3, 'American', 'assets/logo/bonsai4.jpg'),
    InterestsModel(4, 'Marocan', 'assets/logo/bonsai5.jpg')
  ];
    */