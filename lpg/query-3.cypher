// Dotaz vrátí všechny Automaty v Továrne 3 s kapcitou >= 100 a seřadí podle názvu automatu
Match(auto:Automat) -[:NacházíSaV]->(Továrna3:Továrna {název:"Továrna 3"})
WHERE auto.kapacita >= 100
Return auto.název, auto.kapacita, auto.šířka, auto.délka, auto.výška 
ORDER BY auto.název
