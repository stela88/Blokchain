const hre = require('hardhat');

async function deploy() {
	const DonationCampaign = await hre.ethers.getContractFactory('DonationCampaign');
	const donation = await DonationCampaign.deploy();
	await donation.deployed();

	console.log('DonationCampaign contract deployed to:', donation.address);
}

async function main() {
	try {
		await deploy();
		process.exit(0);
	} catch (e) {
		console.error(e);
		process.exit(0);
	}
}

main();