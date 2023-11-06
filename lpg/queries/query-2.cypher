
// Dotaz vrátí všechny kolegy Zaměstnance jménem: Hádes Černý
MATCH (Hades:Zaměstnanec {jméno:'Hádes', přijmení:'Černý'})<-[:Zaměstnává]-(m)-[:Zaměstnává]->(coZam) RETURN coZam.jméno, coZam.přijmení
