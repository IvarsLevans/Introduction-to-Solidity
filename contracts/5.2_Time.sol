pragma solidity >=0.7.0 <0.9.0;

contract Coin {
    uint contractStartTime;
    address public minter;
    mapping (address => uint) public balances;
    
    event Sent(address from, address t, uint amount);
    
    modifier onlyMinter {
        require(msg.sender == minter, "Only owner can call this function");
        _;
    }
    
    modifier amountGreaterThan(uint amount) {
        require(amount < 1e60);
        _;
    }
    
    modifier balanceGreaterThanAmount(uint amount) {
        require(amount <= balances[msg.sender], "Insufficent balance.");
        _;
    }
    
    constructor() {
        minter = msg.sender;
        contractStartTime = block.timestamp;
    }
    
    function mint(address receiver, uint amount) public onlyMinter amountGreaterThan(amount) {
        require(amount < 1e60);
        balances[receiver] += amount;
    }
    
    function send(address receiver, uint amount) public balanceGreaterThanAmount(amount) {
    require(block.timestamp >= contractStartTime + 30);
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}