// Najdi všechny sladkosti, které obsahují alergen mléko
Match(slad:Sladkost)-[:Obsahuje]->(sur:Surovina)-[:Obsahuje]->(aler:Alergén {název: "mléko"})
Return Distinct slad.název, slad.hmotnost