// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

// title: Luckin
// @custom:security-contact: add7348@outlook.com
contract Luckin{
    // link the order
    mapping(uint256 => address) public idToAddress;

    // current totalsupply
    uint256 private totalSupply;
    // the first coffee to sale, when it's been sold, id++
    uint256 private id;

    // broadcast a coffee purchase
    event coffeePurchased(address indexed buyer, uint256 indexed coffeeId);

    // error
    error noMoreCoffee();    

    // make one more coffee
    function makeCoffee() external {
        totalSupply++;
    }

    // return if there is spare coffee
    function haveSpareCoffee() external view returns (bool) {
       return id < totalSupply;
    }

    // buy coffee
    function buyCoffee() external {
        // require(id < totalSupply, "No more coffee!!!");
        if (id < totalSupply) revert noMoreCoffee();
        idToAddress[id] = msg.sender;
        emit coffeePurchased(msg.sender, id);
        id++;
    }
}
