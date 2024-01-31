// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {

  const owner = "0x1Ab8b40D42AF1B8DfD798D60204A678D47949Ff0";

  const Luckin = await hre.ethers.getContractFactory("Luckin");
  const luckin = await Luckin.deploy();


  console.log(`Luckin deployed in ${luckin.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
