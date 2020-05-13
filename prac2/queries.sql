SELECT c.name AS company_name, s.name AS ship_name, r.codeinstallation AS code_restaulrant
FROM company c
INNER JOIN ship s ON s.idcompany = c.id
INNER JOIN restaurant r ON r.idcompany = c.id AND r.nameship = s.name
INNER JOIN installation i ON i.code = r.codeinstallation
INNER JOIN isspecializedin iss ON iss.coderestaurant = r.codeinstallation
INNER JOIN style st ON iss.codestyle = st.code AND st.name = 'Mediterranean cuisine'
ORDER BY c.name, s.name;

CREATE VIEW V_Mediterranean(company_name, ship_name, code_restaurant) AS
    SELECT c.name, s.name, r.codeinstallation
    FROM company c
    INNER JOIN ship s ON s.idcompany = c.id
    INNER JOIN restaurant r ON r.idcompany = c.id AND r.nameship = s.name
    INNER JOIN installation i ON i.code = r.codeinstallation
    INNER JOIN isspecializedin iss ON iss.coderestaurant = r.codeinstallation
    INNER JOIN style st ON iss.codestyle = st.code AND st.name = 'Mediterranean cuisine'
    ORDER BY c.name, s.name;

SELECT DISTINCT
    c.name AS company_name,
    s.name AS ship_name,
    s.maxcapacity AS ship_capacity,
    (SELECT SUM (ins.maxcapacity)
    FROM installation ins, restaurant r
    WHERE ins.code = r.codeinstallation AND r.nameship = s.name AND r.idcompany = c.id
    ) as restaurant_capacity,
    ROUND((SELECT SUM (ins.maxcapacity)
    FROM installation ins, restaurant r
    WHERE ins.code = r.codeinstallation AND r.nameship = s.name AND r.idcompany = c.id
    ) / s.maxcapacity * 10000) / 100 as percentage_capacity
FROM company c
INNER JOIN ship s ON s.idcompany = c.id
ORDER BY percentage_capacity DESC;
