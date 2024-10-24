// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract simplestorage {
    uint256 private favoriteNumber; //  stores the user's favorite number

    uint256[] public fovoriteNumbers; // Dymamic array to store multiple favorite numbers

    // Struct to store a person's name and their favorite number
    struct person {
        string name; // Person's name
        uint256 favoriteNumber; // Their favorite number
    }

    person[] public people; // Array of person structs to store multiple people's data

    //Enum to manage contract states (Active or Inactive)
    enum contractstate {
        Active, //state representing an active contract
        Inactive //state represeting an inactive contract
    }

    contractstate public state; // state variable to store the current contract

    function storeNumber(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function getFavoriteNumber() public view returns (uint256) {
        return favoriteNumber;
    }

    function isGreaterThan(uint256 _compareValue) public view returns (bool) {
        if (favoriteNumber > _compareValue) {
            return true;
        } else {
            return false;
        }
    }

    function sumToFavoriteNumber() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 1; i <= favoriteNumber; i++) {
            sum += i;
        }
        return sum;
    }

    function internalFunction() internal pure returns (string memory) {
        return "This is an internal function"; //Internal: can be accessed within this contract or derived contracts
    }

    //Wrapper function to expose internalFunction for testing purposes
    function callInternalFunction() public pure returns (string memory) {
        return internalFunction(); //calls the internal fuction from within the contract
    }

    function externalFunction() external pure returns (string memory) {
        return "This is an external function"; //can omly be calledfrom outside the contract
    }

    function testExternalFuntion() public view returns (string memory) {
        return this.externalFunction(); //calls the external function from within the contract using 'this'
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(person(_name, _favoriteNumber));
    }

    function activatecontract() public {
        state = contractstate.Active;
    }

    function deactivatecontract() public {
        state = contractstate.Inactive;
    }

    function isActive() public view returns (bool) {
        return state == contractstate.Active;
    }
}
