//In the query below I want to show all candidates who Ran In specific(Longford–Westmeath) Constituency 
//Then I'm matching Candidate with Party


MATCH (c:Constituency) where c.name = 'Longford–Westmeath'
    OPTIONAL MATCH (x:Candidate)-[:Ran_In]->(c:Constituency)
    OPTIONAL MATCH (x:Candidate)-[:Is_In]->(p:Party)
RETURN c,x,p
