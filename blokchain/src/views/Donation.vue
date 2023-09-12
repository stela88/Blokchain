<template>
  <div class="container">
    <h1>Donacije za zaštitu životinja</h1>
    <form class="donation-form" @submit.prevent="submitForm">
      <div class="form-group">
        <label for="fullName">Ime i prezime:</label>
        <input
          type="text"
          id="fullName"
          v-model="donationData.fullName"
          required
        />
      </div>
      <div class="form-group">
        <label for="donationAmount">Donacija:</label>
        <input
          type="number"
          id="donationAmount"
          v-model="donationData.donationAmount"
          required
        />
      </div>
      <div class="form-group">
        <label for="organization">Odaberite udrugu:</label>
        <select id="organization" v-model="donationData.organization" required>
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
          v-model="donationData.message"
          required
        ></textarea>
      </div>
      <button type="submit">Doniraj</button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      donationData: {
        fullName: "",
        donationAmount: null,
        organization: "",
        message: "",
      },
    };
  },
  methods: {
    submitForm() {
      console.log(this.donationData);
      this.donationData = {
        fullName: "",
        donationAmount: null,
        organization: "",
        message: "",
      };
    },
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
