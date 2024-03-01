import 'commuters.dart';
// imports commuters file


abstract class Vehicle {
  int capacity;
  int initialCapacity=0;
  String id;
  static int numberOfVehicles = 0;
  List<Commuter> passengers =[]; //defines an empty list of passengers

  Vehicle(this.capacity, this.id)
  {
    numberOfVehicles++;
    initialCapacity = capacity; //increments number of vehicles per instance and assigns capacity to initialCapacity
  }

  double calculateFare(String destination);

  // Getter function
  int get getCapacity => capacity;

  void updateCapacity(int newCapacity) {
    capacity = newCapacity; // Setter for capacity
  }
  // Getter function
  String get _getID => id;

  //addCommuter function for the passengers
  void addCommuter(Commuter commuterName)
  {
    passengers.add(commuterName);
  }
  
  //prints fare matrix
  void printFareMatrix();

  //print passengers
  void printPassengers()
  {
    print("[$id] - Max Capacity: ${initialCapacity}");
    for (Commuter commuter in passengers){
      print("[${commuter.id}] Wallet balance: ${commuter.walletBalance}| Travel Log: ${commuter.travelLog}");
    }
    
  }
}

class Taxi extends Vehicle {
  static int numOfTaxis = 0;
  Taxi(int capacity) : super(capacity, "TAXI${numOfTaxis}"){numOfTaxis++;}

  @override
  double calculateFare(String destination) {
    if (destination == "Taft") {
      return 70;
    } else if (destination == "Magallanes") {
      return 80;
    } else if (destination == "Ayala") {
      return 90;
    } else if (destination == "Buendia") {
      return 100;
    } else if (destination == "Guadalupe") {
      return 110;
    } else {
      return 0;
    }
  }

  @override
  void printFareMatrix()
  {
    print("***** Taxi Fare Matrix *****");
    print("\tTaft: P70.0");
    print("\tMagallanes: P80.0");
    print("\tAyala: P90.0");
    print("\tBuendia: P100.0");
    print("\tGuadalupe: P110.0");
    print("***************************\n");
  }
  
  @override
  String get _getID => super._getID;
}

class Bus extends Vehicle {
  static int numOfBuses = 0;
  Bus(int capacity) : super(capacity, "BUS${numOfBuses}"){numOfBuses++;}

  @override
  double calculateFare(String destination) {
    if (destination == "Taft") {
      return 20;
    } else if (destination == "Magallanes") {
      return 30;
    } else if (destination == "Ayala") {
      return 40;
    } else if (destination == "Buendia") {
      return 50;
    } else if (destination == "Guadalupe") {
      return 60;
    } else {
      return 0;
    }
  }

  @override
  void printFareMatrix()
  {
    print("***** BUS Fare Matrix *****");
    print("\tTaft: P20.0");
    print("\tMagallanes: P30.0");
    print("\tAyala: P40.0");
    print("\tBuendia: P50.0");
    print("\tGuadalupe: P60.0");
    print("***************************\n");
  }
  
  @override
  String get _getID => super._getID;
}
