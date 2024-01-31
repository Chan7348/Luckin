// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

// title: Luckin
// @custom:security-contact: add7348@outlook.com
contract Luckin{
    mapping(uint256 => address) public idToAddress;
    uint256 private totalSupply;
    uint256 private id;

    event coffeePurchased(address indexed buyer, uint256 indexed coffeeId);

    error noMoreCoffee();    


    function makeCoffee() public {
        totalSupply++;
    }

    function haveSpareCoffee() public view returns (bool) {
       return id < totalSupply;
    }

    function buyCoffee() public {
        // require(id < totalSupply, "No more coffee!!!");
        if (id < totalSupply) revert noMoreCoffee();
        idToAddress[id] = msg.sender;
        emit coffeePurchased(msg.sender, id);
        id++;
    }
}
