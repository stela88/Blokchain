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
        <label for="donationAmount">Donacija:</label>
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
          <option value="Udruga 1">SNOOPY</option>
          <option value="Udruga 2">Udruga Fido</option>
          <option value="Udruga 3">Društvo za zaštitu životinja Rijeka</option>
          <option value="Udruga 4">Lunjo i Maza </option>
          <option value="Udruga 5">DRUGA PRILIKA</option>

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
const contractAddress = '0x5FbDB2315678afecb367f032d93F642f64180aa3';
export default {
  data() {
    return {
        fullName: "",
        donationAmount: null,
        organization: "",
        message: ""
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
					contract = new ethers.Contract(contractAddress, DonationCampaign.abi, signer);

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
				const donationAmount = this.donationAmount;
				const organization = this.organization;
				const message = this.message;

				// Ensure signer is connected and has a valid Ethereum address
				if (!signer || !signer.getAddress()) {
					throw new Error('Please connect to your Ethereum wallet (e.g., MetaMask).');
				}

				// Initialize the contract with the signer
				contract = new ethers.Contract(contractAddress, DonationCampaign.abi, signer);

				// Make the contract call to add a pet
				const tx = await contract.Donation(fullName, donationAmount, organization, message);
				await tx.wait();

				// Handle success or show a confirmation message
				console.log('Donation added successfully!');
				document.getElementById('error').innerHTML = '';
				alert('Donation added successfully!');
			} catch (error) {
				// Handle errors, e.g., display an error message
				console.error('Error adding donation:', error);
			}
    },
  },
    async mounted() {
		// Call the connectWallet method to initialize Ethereum connection
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
