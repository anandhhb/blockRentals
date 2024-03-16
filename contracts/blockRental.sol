// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract blockRental {

    address public owner;
    constructor() {
        owner = msg.sender;
    }

    struct Car {
        address carOwner;
        string model;
        uint year;
        string licenseNumber;
        uint carID;
        bool isAvailable;
    }

    struct Rental {
        uint carID;
        address rentee;
    }

    Car[] public cars;
    Rental[] public rentals;

// Get the count of Total cars

    function getCarCount() private view returns(uint) {
        return rentals.length;
    }

// Add cars to the Blockchain
    function addCar(string memory _model, uint _year, string memory _license) public returns (uint) {
        uint count = getCarCount();
        address carOwner = msg.sender;
        Car memory newCar = Car(carOwner,_model,_year,_license,count,true);
        cars.push(newCar);
        return count;
    }

// Rent a Car

    function rentCar(uint carID) public returns (bool){
        Car storage carToRent = cars[carID];
        if(carToRent.isAvailable == true){
            Rental memory rent = Rental(carID,msg.sender);
            rentals.push(rent);
            return true;
        }
        else {
            return false;
        }
    }

// List Cars

    function listCars() public view returns (Car[] memory) {
        Car[] memory carArray = new Car[](cars.length);
        for (uint i = 0; i < cars.length; i++) {
            carArray[i] = cars[i];
        }
        return carArray;
    }

// Rental History

    function history() public view returns (Rental[] memory) {
        Rental[] memory rentalArray = new Rental[](rentals.length);
        for (uint i = 0; i < rentals.length; i++) {
            rentalArray[i] = rentals[i];
        }
        return rentalArray;
    }
}