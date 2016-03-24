#### QUERY 3 ####

//Here I'm displaying the Properties (under Label title) of all nodes combined and their count (Count title).
//More in ReadMe File

MATCH (n) 
WITH DISTINCT LABELS(n) AS interim, COUNT(n) AS interimCount
UNWIND interim AS Label
RETURN Label, SUM(interimCount) AS Count


#### QUERY 4 ####

//This query returns all Constituencies that have specific number of seats(5 in example).
//Can be used for any property that node holds (ex. Population, Seats)
//Good for checking everything is right in terms of if the nodes property works correctly.

MATCH (p:Constituency)
WHERE p.seats='5'
RETURN p
