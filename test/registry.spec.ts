import { expect } from "chai";
import { ethers, upgrades } from "hardhat";

describe("CeloHTRegistryV2", () => {
  it("adds initiative and enforces roles", async () => {
    const [admin, other] = await ethers.getSigners();
    const F = await ethers.getContractFactory("CeloHTRegistryV2");
    const r = await upgrades.deployProxy(F, [admin.address], { kind: "uups" });
    await r.addInitiative("Edu", "Education", "ipfs://meta");
    expect(await r.totalInitiatives()).to.eq(1);
    await expect(r.connect(other).addInitiative("X","Agents","ipfs://x")).to.be.reverted;
  });
});