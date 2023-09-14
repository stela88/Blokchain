<template>
  <div class="container">
    <h1>Donacije za zaštitu životinja</h1>
    <div class="donation">
      <div class="form-group">
        <label for="fullName">Ime i prezime:</label>
        <input
          type="text"
          id="fullName"
          name="fullName"
          v-model="fullName"
          required
        />
      </div>
      <div class="form-group">
        <label for="donationAmount">Donacija (ETH):</label>
        <input
          type="number"
          id="donationAmount"
          name="donationAmount"
          v-model="donationAmount"
          required
        />
      </div>
      <div class="form-group">
        <label for="organization">Odaberite udrugu:</label>
        <select id="organization" name="organization" v-model="organization" required>
          <option value="1">SNOOPY</option>
          <option value="2">Udruga Fido</option>
          <option value="3">Društvo za zaštitu životinja Rijeka</option>
          <option value="4">Lunjo i Maza</option>
          <option value="5">DRUGA PRILIKA</option>
        </select>
      </div>
      <div class="form-group">
        <label for="message">Poruka za životinje:</label>
        <textarea
          id="message"
          name="message"
          v-model="message"
          required
        ></textarea>
      </div>
      <button class="button" @click="Donation()">Doniraj</button>
			<p id="error"></p>
    </div>
  </div>
</template>

<script>
import { ethers } from 'ethers';
import detectEthereumProvider from '@metamask/detect-provider';
import DonationCampaign from '../services/DonationCampaign.json';

let provider; 
let signer; 
let contract; 
export default {
  data() {
  return {
    fullName: "",
    donationAmount: null,
    organization: "", 
    message: "",
    accountSelections: {
      "1": "0x1Fc78A4113F50034Bd4C179993cBC70DC8EF45FB",
      "2": "0x37f05EFd4B303642886a4bB3F16C1816E2B2DC63",
      "3": "0xc6E40510b71806dbf957d154dCF7617A3C584D3e",
      "4": "0x1D8565320289E1a257c7F8dC42e94a1Bf08b4475",
      "5": "0x24805813DDB39ae1154aFe8Fae71F1816E6c74cC"
    }
  };
},

  methods: {
    async connectWallet() {
			try {
				const ethereum = await detectEthereumProvider();

				if (ethereum) {
					provider = new ethers.providers.Web3Provider(ethereum);
					signer = provider.getSigner();

					// Ensure the user is connected to their wallet
					await ethereum.request({ method: 'eth_requestAccounts' });

					// Initialize the contract with the signer
					contract = new ethers.Contract(contractAddress, DonationCampaign.abi);

				} else {
					throw new Error(
						'Ethereum provider not detected. Please install MetaMask or another compatible wallet.'
					);
				}
			} catch (error) {
				// Handle errors, e.g., display an error message
				console.error('Error connecting wallet:', error);
			}
	},
    async Donation() {
  try {
    const fullName = this.fullName;
    const donationAmount = ethers.utils.parseEther(this.donationAmount);
    const organization = parseInt(this.organization);
    const message = this.message;

    // Dobijte odabranu adresu za udrugu
    const contractAddress = this.accountSelections[organization];

    if (!signer || !signer.getAddress()) {
      throw new Error('Please connect to your Ethereum wallet (e.g., MetaMask).');
    }

    contract = new ethers.Contract(contractAddress, DonationCampaign.abi, signer);
    const tx = await contract.donate(fullName, donationAmount, organization, message);
    await tx.wait();

    console.log('Donation added successfully!');
    document.getElementById('error').innerHTML = '';
    alert('Donation added successfully!');
  } catch (error) {
    console.error('Error adding donation:', error);
  }
},

  },
    async mounted() {

		await this.connectWallet();
	},
};
</script>

<style scoped>
.container {
  text-align: center;
  padding: 20px;
}

.donation-form {
  max-width: 400px;
  margin: 0 auto;
}

.form-group {
  margin-bottom: 10px;
}

label {
  display: block;
}

input[type="text"],
input[type="number"],
select,
textarea {
  width: 100%;
  padding: 10px;
  margin: 5px 0;
}

button {
  background-color: #007BFF;
  color: white;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
  transition: background-color 0.3s;
}

button:hover {
  background-color: #0056b3;
}
</style>