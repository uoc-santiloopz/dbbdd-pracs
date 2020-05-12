# 2-1
SELECT c.name AS company_name, s.name AS ship_name, r.codeinstallation AS code_restaurant
FROM company c, ship s, restaurant r
WHERE c.id = s.idcompany;
