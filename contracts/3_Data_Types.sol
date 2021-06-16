pragma solidity >=0.7.0 <0.9.0;

/*
contract myContract {
    uint public myUint = 1;
    int public myInt = 1;
    string public myString = "myString"
    bool public myBool = true;
}
*/

contract myGame {
    
    uint public playerCount = 0;
//  Player[] public players;
    mapping (address => Player) public players;
    
    enum Level {Novice, Intermediate, Advanced}
    
    struct Player {
        address playerAddress;
        Level playerLevel;
        string firstName;
        string lastName;
    }
    
    function addPlayer(string memory firstName, string memory lastName) public {
//      players.push(Player(firstName, lastName));
        players[msg.sender] = Player(msg.sender, Level.Novice, firstName, lastName);
        playerCount += 1;
    }
    
    function getPlayerLevel(address playerAddress) public view returns(Level) {
        return players[playerAddress].playerLevel;
    }
}

// constant: keyword added to a variable that tells solidity that it cannot be changed.

// struct: Struct types are used to represent a record. They allow you to create your own data types.

// enum: Enum restricts a variable to have one of only a few predefined values. The values in this enumarated list are called enums.

// array: Player[] public players;