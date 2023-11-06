
// Zaměstnanci
CREATE (Zeus:Zaměstnanec {jméno:'Zeus', přijmení:'Hromný'})
CREATE (Athena:Zaměstnanec {jméno:'Athéna', přijmení:'Múdra'})
CREATE (Hades:Zaměstnanec {jméno:'Hádes', přijmení:'Černý'})
CREATE (Afrodita:Zaměstnanec {jméno:'Afrodita', přijmení:'Krásna'})
CREATE (Hermes:Zaměstnanec {jméno:'Hermes', přijmení:'Kováč'})

CREATE (Artemis:Zaměstnanec {jméno:'Artemis', přijmení:'Lesná'})
CREATE (Apollo:Zaměstnanec {jméno:'Apollo', přijmení:'Liečivý'})

// Továrny
CREATE (Továrna1:Továrna {název:'Továrna 1', rychlostVyroby:32})
CREATE (Továrna2:Továrna {název:'Továrna 2', rychlostVyroby:64})
CREATE (Továrna3:Továrna {název:'Továrna 3', rychlostVyroby:128})

// Sladkost
CREATE (Sladkost1:Sladkost {název:'Sladkost 1', hmotnost:125, šířka:50, délka:60, výška: 120})
CREATE (Sladkost2:Sladkost {název:'Sladkost 2', hmotnost:75, šířka:60, délka:60, výška: 70})
CREATE (Sladkost3:Sladkost {název:'Sladkost 3', hmotnost:50, šířka:50, délka:30, výška: 80})

//Automat
CREATE (Automat1:Automat {název:'Automat 1', kapacita:120, šířka:50, délka:70, výška: 200})
CREATE (Automat2:Automat {název:'Automat 2', kapacita:120, šířka:50, délka:70, výška: 200})
CREATE (Automat3:Automat {název:'Automat 3', kapacita:110, šířka:50, délka:70, výška: 180})
CREATE (Automat4:Automat {název:'Automat 4', kapacita:110, šířka:50, délka:70, výška: 180})

// Suroviny
CREATE (Múka:Surovina {název:'múka', cenaZaKilo:24})
CREATE (Maslo:Surovina {název:'maslo', cenaZaKilo:56})
CREATE (Cukor:Surovina {název:'cukor', cenaZaKilo:20})
CREATE (Vejce:Surovina {název:'vejce', cenaZaKilo:100})
CREATE (Čokoláda:Surovina {název:'čokoláda', cenaZaKilo:100})
CREATE (Mléko:Surovina {název:'mléko', cenaZaKilo:23})

// Alergény 
CREATE (Lepek:Alergén {název:'lepek', číslo:1})
CREATE (VejceAlergén:Alergén {název:'vejce', číslo:3})
CREATE (Arašídy:Alergén {název:'arašídy', číslo:4})
CREATE (Sója:Alergén {název:'sója', číslo:6})
CREATE (MlékoAlergén:Alergén {název:'mléko', číslo:7})


// Zaměstnává
CREATE
(Továrna1)-[:Zaměstnává]->(Zeus),
(Továrna1)-[:Zaměstnává]->(Athena),

(Továrna2)-[:Zaměstnává]->(Hades),
(Továrna2)-[:Zaměstnává]->(Afrodita),
(Továrna2)-[:Zaměstnává]->(Hermes),

(Továrna3)-[:Zaměstnává]->(Apollo),
(Továrna3)-[:Zaměstnává]->(Artemis)

// Obsahuje Alergén
CREATE
(Múka)-[:Obsahuje]->(Lepek),
(Mléko)-[:Obsahuje]->(MlékoAlergén),
(Maslo)-[:Obsahuje]->(MlékoAlergén),
(Vejce)-[:Obsahuje]->(VejceAlergén),
(Čokoláda)-[:Obsahuje]->(Arašídy),
(Čokoláda)-[:Obsahuje]->(MlékoAlergén)

// Obsahuje Surovinu
Create
(Sladkost1)-[:Obsahuje]->(Čokoláda),
(Sladkost1)-[:Obsahuje]->(Mléko),
(Sladkost1)-[:Obsahuje]->(Múka),
(Sladkost2)-[:Obsahuje]->(Múka),
(Sladkost2)-[:Obsahuje]->(Mléko),
(Sladkost2)-[:Obsahuje]->(Vejce),
(Sladkost2)-[:Obsahuje]->(Cukor),
(Sladkost2)-[:Obsahuje]->(Maslo),
(Sladkost3)-[:Obsahuje]->(Čokoláda),
(Sladkost3)-[:Obsahuje]->(Múka),
(Sladkost3)-[:Obsahuje]->(Maslo)

// Vyrábí
Create
(Továrna1)-[:Vyrábí]->(Sladkost1),
(Továrna2)-[:Vyrábí]->(Sladkost1),
(Továrna2)-[:Vyrábí]->(Sladkost2),
(Továrna3)-[:Vyrábí]->(Sladkost2),
(Továrna3)-[:Vyrábí]->(Sladkost3)

//Nabízí
Create
(Automat1)-[:Nabízí]->(Sladkost1),
(Automat1)-[:Nabízí]->(Sladkost2),
(Automat1)-[:Nabízí]->(Sladkost3),
(Automat2)-[:Nabízí]->(Sladkost1),
(Automat2)-[:Nabízí]->(Sladkost2),
(Automat2)-[:Nabízí]->(Sladkost3),

(Automat3)-[:Nabízí]->(Sladkost2),
(Automat3)-[:Nabízí]->(Sladkost3),
(Automat4)-[:Nabízí]->(Sladkost2),
(Automat4)-[:Nabízí]->(Sladkost3)

//Nachází sa v
Create
(Automat1)-[:NacházíSaV]->(Továrna1),
(Automat2)-[:NacházíSaV]->(Továrna2),
(Automat3)-[:NacházíSaV]->(Továrna3),
(Automat4)-[:NacházíSaV]->(Továrna3)
