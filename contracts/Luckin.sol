// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

// title: Luckin
contract Luckin{ // @custom:security-contact: add7348@outlook.com
    
    mapping(uint256 id => address consumer) public idToConsumer; // link the order

    uint256 private totalSupply;  // current totalsupply
    
    uint256 private id; // the first coffee to sale, when it's been sold, id++
    
    event coffeePurchased(address indexed buyer, uint256 indexed coffeeId); // broadcast a coffee purchase

    error noMoreCoffee(); // error   
    
    function makeCoffee() external { // make one more coffee
        totalSupply++;
    }

    
    function haveSpareCoffee() external view returns (bool) { // return if there is spare coffee
       return id < totalSupply;
    }


    function buyCoffee() external { // buy coffee
        // require(id < totalSupply, "No more coffee!!!");
        if (id < totalSupply) revert noMoreCoffee();
        idToConsumer[id] = msg.sender;
        emit coffeePurchased(msg.sender, id);
        id++;
    }
}
