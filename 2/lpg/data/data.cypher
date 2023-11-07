
// Zaměstnanci
CREATE (Zeus:Zaměstnanec {jméno:'Zeus', přijmení:'Hromný', tituly:'Nej.'})
CREATE (Athena:Zaměstnanec {jméno:'Athéna', přijmení:'Múdra', tituly: 'Pí.'})
CREATE (Hades:Zaměstnanec {jméno:'Hádes', přijmení:'Černý', tituly: 'PPodsv.'})
CREATE (Afrodita:Zaměstnanec {jméno:'Afrodita', přijmení:'Krásna', tituly: 'Nejkr.'})
CREATE (Hermes:Zaměstnanec {jméno:'Hermes', přijmení:'Kováč', tituly: 'Buch.'})
CREATE (Artemis:Zaměstnanec {jméno:'Artemis', přijmení:'Lesná', tituly: 'LukStř.'})
CREATE (Apollo:Zaměstnanec {jméno:'Apollo', přijmení:'Liečivý', tituly: 'Lig.'})

// Továrny
CREATE (TovárnaKarlíkova:Továrna {název:'Karlíkova továrna na čokoládu', rychlostVyroby:32})
CREATE (TovárnaHaribo:Továrna {název:'Haribo Industries', rychlostVyroby:64})
CREATE (TovárnaCukPrum:Továrna {název:'Cukrárenská průmyslovka', rychlostVyroby:128})

// Sladkost
CREATE (Tatranka:Sladkost {název:'Tatranka', hmotnost:125, šířka:50, délka:60, výška: 120})
CREATE (Nektar:Sladkost {název:'Nektar', hmotnost:75, šířka:60, délka:60, výška:70})
CREATE (ČokoDortík:Sladkost {název:'Čokoládový dortík', hmotnost:50, šířka:50, délka:30, výška: 80})

//Automat
CREATE (AutomatUVrátnice:Automat {název:'U Vrátnice', kapacita:120, šířka:50, délka:70, výška: 200})
CREATE (AutomatRychláMňamka:Automat {název:'Rychlá Mňamka', kapacita:120, šířka:50, délka:70, výška: 200})
CREATE (AutomatPohoštěníVMezipatře:Automat {název:'Pohoštění V Mezipatře', kapacita:110, šířka:50, délka:70, výška: 180})
CREATE (AutomatOblačnéObčerstvení:Automat {název:'Oblačné Občerstvení', kapacita:110, šířka:50, délka:70, výška: 180})

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
(TovárnaKarlíkova)-[:Zaměstnává {pozice:'Šéf'}]->(Zeus),
(TovárnaKarlíkova)-[:Zaměstnává {pozice:'U pásu'}]->(Athena),

(TovárnaHaribo)-[:Zaměstnává {pozice:'Vrátný'}]->(Hades),
(TovárnaHaribo)-[:Zaměstnává {pozice:'Modelka do reklam'}]->(Afrodita),
(TovárnaHaribo)-[:Zaměstnává {pozice:'U pásu'}]->(Hermes),

(TovárnaCukPrum)-[:Zaměstnává {pozice:'Technik'}]->(Apollo),
(TovárnaCukPrum)-[:Zaměstnává {pozice:'U pásu'}]->(Artemis)

// Obsahuje Alergén
CREATE
(Múka)-[:Obsahuje {závažnostObjemu:92}]->(Lepek),
(Mléko)-[:Obsahuje {závažnostObjemu:100}]->(MlékoAlergén),
(Maslo)-[:Obsahuje {závažnostObjemu:63}]->(MlékoAlergén),
(Vejce)-[:Obsahuje {závažnostObjemu:100}]->(VejceAlergén),
(Čokoláda)-[:Obsahuje {závažnostObjemu:42}]->(Arašídy),
(Čokoláda)-[:Obsahuje {závažnostObjemu:38}]->(MlékoAlergén)

// Obsahuje Surovinu
Create
(Tatranka)-[:Obsahuje]->(Čokoláda),
(Tatranka)-[:Obsahuje]->(Mléko),
(Tatranka)-[:Obsahuje]->(Múka),
(Nektar)-[:Obsahuje]->(Múka),
(Nektar)-[:Obsahuje]->(Mléko),
(Nektar)-[:Obsahuje]->(Vejce),
(Nektar)-[:Obsahuje]->(Cukor),
(Nektar)-[:Obsahuje]->(Maslo),
(ČokoDortík)-[:Obsahuje]->(Čokoláda),
(ČokoDortík)-[:Obsahuje]->(Múka),
(ČokoDortík)-[:Obsahuje]->(Maslo)

// Vyrábí
Create
(TovárnaKarlíkova)-[:Vyrábí]->(Tatranka),
(TovárnaHaribo)-[:Vyrábí]->(Tatranka),
(TovárnaHaribo)-[:Vyrábí]->(Nektar),
(TovárnaCukPrum)-[:Vyrábí]->(Nektar),
(TovárnaCukPrum)-[:Vyrábí]->(ČokoDortík)

//Nabízí
Create
(AutomatUVrátnice)-[:Nabízí {cena:17}]->(Tatranka),
(AutomatUVrátnice)-[:Nabízí {cena:1024}]->(Nektar),
(AutomatUVrátnice)-[:Nabízí {cena:56}]->(ČokoDortík),
(AutomatRychláMňamka)-[:Nabízí {cena:15}]->(Tatranka),
(AutomatRychláMňamka)-[:Nabízí {cena:999}]->(Nektar),
(AutomatRychláMňamka)-[:Nabízí {cena:48}]->(ČokoDortík),
(AutomatPohoštěníVMezipatře)-[:Nabízí {cena:1060}]->(Nektar),
(AutomatPohoštěníVMezipatře)-[:Nabízí {cena:63}]->(ČokoDortík),
(AutomatOblačnéObčerstvení)-[:Nabízí {cena:1}]->(Nektar),
(AutomatOblačnéObčerstvení)-[:Nabízí {cena:1}]->(ČokoDortík)

//Nachází sa v
Create
(AutomatUVrátnice)-[:NacházíSaV]->(TovárnaKarlíkova),
(AutomatRychláMňamka)-[:NacházíSaV]->(TovárnaHaribo),
(AutomatPohoštěníVMezipatře)-[:NacházíSaV]->(TovárnaCukPrum),
(AutomatOblačnéObčerstvení)-[:NacházíSaV]->(TovárnaCukPrum)
