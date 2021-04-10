class MyService {

  static final MyService _instance = MyService._internal();

  // passes the instantiation to the _instance object
  factory MyService() => _instance;

  //initialize variables in here
  MyService._internal() {
    _screen = 0;
  }

  int _screen;

  //short getter for my variable
  int get screen => _screen;

  //short setter for my variable
  set screen(int value) => _screen = value;
  void modifyscreen(int value)=>  _screen = value;
  
}