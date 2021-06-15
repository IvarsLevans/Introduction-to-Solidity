pragma solidity >=0.7.0 <0.9.0;

contract Coin {
    address public minter;
    mapping (address => uint) public balances;
    
    event Sent(address from, address t, uint amount);
    
    constructor() {
        minter = msg.sender;
    }
    
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount;
    }
    
    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficent balance.");
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}

// Address: Every account and smart contract has an address. It is used to send and recieve Ether from one account to another.
//          You can consider it your public identity on the Blockchain.

// Mapping: Mappings act as hash tables which consist of key types and corresponding value type pairs.
//          ( Data type used to store association. )

// Event: When you call an event, it causes the arguments to be stored in the transaction's log.

// Emit: Keyword used to call Events

// Constructor: Function that is run directly when the contract is created.

// Msg: Keyword thats allows us to access some special variables tjat are available for us from the blockchain.

// Require: Guarantees validity of conditions that cannot be detected before execution.