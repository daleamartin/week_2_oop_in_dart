import "vehicles.dart";
//imports the vehicle file
abstract class Commuter
{
  double walletBalance; 
  String id; 
  String get _getID => id; // private 
  double get _getWalletBalance => walletBalance;// private
  List<String> travelLog = [];
  static int numberOfCommuters = 0;
  Commuter(this.walletBalance, this.id)
  {
    numberOfCommuters++;
  } //increments numberof commuters per instance

  void ride(String destination, Vehicle vehicleID);
}

class Regular extends Commuter
{
  static int numOfRegulars = 0;

  Regular(double walletBalance):super(walletBalance, "REG${numOfRegulars}"){numOfRegulars++;}

  @override

  void ride(String destination, Vehicle vehicleName)
 
  //minus the capacity in vehicleName
  //minus the walletBalance
  {
    double fare = 0;
    // check if vehicle is taxi or bus
    if(vehicleName is Taxi)
    {
      //fare to store the calculated fare
      fare = (vehicleName as Taxi).calculateFare(destination);
    }
    else if(vehicleName is Bus)
    {
      fare = (vehicleName as Bus).calculateFare(destination);
    }
    //check if vehicle still hascapacity
    if (vehicleName.capacity <= 0) {
      print("Sorry, the vehicle ${vehicleName.id} is full.");
      return;
    }
    // Check if walletBalance is greater than fare
    if (fare > walletBalance) {
      print("Passenger ${id} does not have enough fare to ride ${vehicleName.id}!");
      return;
    }
    
    vehicleName.updateCapacity(vehicleName.capacity - 1);
    walletBalance = walletBalance - fare;

    //updates the travel log
    String rideDetails = "${vehicleName.id} - $destination";
    travelLog.add(rideDetails);
    vehicleName.addCommuter(this);
    print("Passenger ${id} successfully boarded ${vehicleName.id} with a fare of P$fare");
  }
}

class SeniorPwd extends Commuter 
{
  static int numOfSeniorPwds = 0;

  SeniorPwd(double walletBalance):super(walletBalance, "SENPWD${numOfSeniorPwds}"){numOfSeniorPwds++;}

  @override
  void ride(String destination, Vehicle vehicleName)
  //this function should:
  //minus the capacity in vehicleName
  //minus the walletBalance
  {
    double fare = 0;
    //check if vehicle is taxi or bus
    if(vehicleName is Taxi)
    {
      //create fare to store the calculated fare
      fare = ((vehicleName as Taxi).calculateFare(destination))*0.8;
    }
    else if(vehicleName is Bus)
    {
      fare = ((vehicleName as Bus).calculateFare(destination))*0.8;
    }
    //check if vehicle still has capacity
    if (vehicleName.capacity <= 0) {
      print("Sorry, the vehicle ${vehicleName.id} is full.");
      return;
    }
    // Check if walletBalance is greater than fare
    if (fare > walletBalance) {
      print("Passenger ${id} does not have enough fare to ride ${vehicleName.id}!");
      return;
    }
    
    vehicleName.updateCapacity(vehicleName.capacity - 1);
    walletBalance = walletBalance - fare;

    //update travel log
    String rideDetails = "[${vehicleName.id} - $destination]";
    travelLog.add(rideDetails);
    vehicleName.addCommuter(this);
    print("Passenger ${id} successfully boarded ${vehicleName.id} with a fare of P$fare");
  }
}