// Dotaz vrátí všechny Automaty v továrně Cukrárenská průmyslovka s kapacitou >= 100 a seřadí podle názvu automatu
Match(auto:Automat) -[:NacházíSaV]->(TovárnaCukPrum:Továrna {název:"Cukrárenská průmyslovka"})
WHERE auto.kapacita >= 100
Return auto.název, auto.kapacita, auto.šířka, auto.délka, auto.výška 
ORDER BY auto.název
