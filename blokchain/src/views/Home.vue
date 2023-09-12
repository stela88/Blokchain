<template>
  <div>
    <header>
      <h1>Donacije za zaštitu životinja</h1>
    </header>

    <main>

      <section>
        <h2>Udruge za zaštitu životinja</h2>
        <div class="udruga" v-for="(udruga, index) in udruge" :key="index">
          <h1>{{udruga.naziv}}</h1>
          <img :src="udruga.slika"> 
          <p>{{ udruga.opis }}</p>
          <br>
          <br>
        </div>
      </section>
      <div>
        <br>
        <h2>Želiš li donirati nekoj od udruga?</h2>
        <router-link to="/donation">
        <button class="button button">Doniraj</button>
        </router-link>
      </div>
    </main>

    <footer>
      <p>&copy; {{ new Date().getFullYear() }} Donacije za zaštitu životinja</p>
    </footer>
  </div>
</template>

<script>
export default {
    name: 'Home',
  data() {
    return {
      udruge: [
        {
          naziv: "SNOOPY",
          slika: require("@/assets/udruga1.jpg"),
          opis: "Upoznajte naše četveronožne prijatelje. Nekima smo prva obitelj, nekima jedna od brojnih. Skrbimo za između 50 - 70 pasa, od kojih se dio nalazi u Skloništu a dio na privremenom smještaju. Liječimo bolesne i ozlijeđene, radimo s uplašenima i traumatiziranima te ih pripremamo za njihove Zauvijek domove. Za one koji su prestari ili neželjeni, SNOOPY je mjesto u kojem će biti sigurni i voljeni do kraja svog života. Svaki pas u Skloništu je cijepljen, čipiran, steriliziran/kastriran i ima EU putovnicu.",
        },
        {
          naziv: "Udruga Fido",
          slika: require("@/assets/udruga2.jpg"),
          opis: "Fido neprofitna je udruga za zaštitu životinja iz Pule, osnovana 2017. godine, sa skloništem blizu Kaštijuna u Medulinu. Ciljevi udruge su pružanje pomoći i zaštite životinjama, edukacija građana o pravima životinja, te promoviranje kvalitetnijeg suživota čovjeka i životinja.",
        },
        {
          naziv: "Društvo za zaštitu životinja Rijeka",
          slika: require("@/assets/udruga3.jpg"),
          opis: "U azilu je 19 pasa kojima je potrebna pomoć, koji su POSEBNI. Svaki od tih pasa traži pomoć, individualni pristup kojim bi se koregiralo ponašanje i pobijedili strahovi. Zato smo odlučili pokrenuti PROJEKT SOCIJALIZACIJE, kojim će se osigurati individualni pristup svakom psu, stručno osposobljenih trenera.",
        },
        {
          naziv: "Lunjo i Maza",
          slika: require("@/assets/udruga4.jpg"),
          opis: " Liburnijsko društvo za zaštitu životinja Lunjo i Maza osnovano je 1998. godine i jedno je od najstarijih u Hrvatskoj, a uz Društvo za zaštitu životinja Rijeka, i jedno od najstarijih u Primorsko-goranskoj županiji. Pokriva prvenstveno područje Liburnije, od Matulja do Brseča, ali i šire. Jedina je registrirana udruga na tom području koja zbrinjava, pomaže, sterilizira, kastrira, liječi i udomljava životinje. Uglavnom se tu u 60 posto slučajeva radi o pomaganju macama, a u 40 posto slučajeva i psima, zbog toga što nemaju adekvatan prostor u kojem bi mogli zbrinuti pse.",
        },
        {
          naziv: "DRUGA PRILIKA",
          slika: require("@/assets/udruga5.jpg"),
          opis: "Akciju Spasimo pse iz šinteraja otpočela je Ana Horvat 1997. godine kada je još bila članica Zagrebačkog društva za zaštitu životinja, a nastaviljena je od 2 000. do 2009. godine kao Akcija novoosnovane udruge za zaštitu napuštenih životinja DRUGA PRILIKA.",
        },
      ],
    };
  },
};
</script>


<style>
/* Postavite veličinu slika */
img {
  width: 600px; /* Promijenite veličinu prema potrebama */
  height: 450px; /* Promijenite veličinu prema potrebama */
}

/* Stilizirajte tekst */
p {
  font-family: Arial, sans-serif; /* Odaberite font prema potrebama */
  font-size: 16px; /* Promijenite veličinu fonta prema potrebama */
  color: #333; /* Promijenite boju teksta prema potrebama */
  text-align: center; /* Centriraj tekst */
  padding-left: 440px; /* Dodaj padding sa svih strana */
  padding-right: 440px;
  margin: 10px 0;
}

.button {
  border: none;
  color: white;
  padding: 30px 260px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 20px;
  margin: 4px 2px;
  cursor: pointer;
}

.button {
  background-color: white;
  color: black;
  border: 2px solid #555555;
}
</style>

