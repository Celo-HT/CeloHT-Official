const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();

  console.log("Deploying with:", deployer.address);

  const Registry = await hre.ethers.getContractFactory("CeloHTRegistry");
  const registry = await Registry.deploy(deployer.address);

  await registry.waitForDeployment();

  console.log("CeloHTRegistry deployed to:", await registry.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});