/** @type import('hardhat/config').HardhatUserConfig */

require('@nomiclabs/hardhat-ethers');

task('accounts', 'Prints the list of accounts', async (taskArgs, hre) => {
	const accounts = await hre.ethers.getSigners();
	const provider = hre.ethers.provider;

	for (const account of accounts) {
		console.log(
			'%s (%i ETH)',
			account.address,
			hre.ethers.utils.formatEther(await provider.getBalance(account.address))
		);
	}
});

module.exports = {
	solidity: '0.8.18',
	networks: {
		hardhat: {
			chainId: 1337,
		},
	},
	defaultNetwork: 'localhost',
};