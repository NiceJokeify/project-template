# Irish Constituencies Neo4j Database
###### Pawel Borzym, G00313594

## Introduction
This is a project about the Irish General Elections that were held in 2016.
Project was done using Neo4J database, it holds information such as Candidate names, Constituencies and Political Parties. 

## Database
The Database was created using Neo4J and changes were implemented using Cypher scripts. 
These Cypher scripts were used to add Candidate Nodes(Names + Surnames), Constituency Nodes, Political Parties and Relationships between all of the nodes.
All of the scripts used in this project are located in the Supports folder.
Other scrips were used to check if nodes were created correctly and that the relationships were done correctly.

######Nodes

| Node          | Description|
| ------------- |------------|
| Party         | Node representing Political Party created, displays the Name|
| Constituency  | Node representing the are Candidate ran in from. Includes the name, seats and the population of the Constituency|
| Candidate     | Node representing the Candidate. Includes the name of the candidate.|



######Relationships
| Relationship  | Description|
| ------------- |------------|
| Ran_In        | Link between Candidate and the Constituency he/she ran in from.|
| Is_In	        | Link between Candidate and the Political Party he/she is member of.|


#####Sample Code

>Sample code used to create node Pat Deering and display Pat Deering node on screen

```cypher
CREATE (:Candidate {name: 'Pat Deering'})
MATCH (x:Candidate) WHERE x.name = 'Pat Deering' RETURN x
```

>Sample code used to Match Candidate node with Political Party and Constituency and create Relationship between them.

```cypher
MATCH (x:Candidate) WHERE x.name = 'Pat Deering' 
OPTIONAL MATCH (p:Party) WHERE p.name = 'Fine Gael'
OPTIONAL MATCH (c:Constituency) WHERE c.name = 'Carlow–Kilkenny'
CREATE x-[:Is_In]->p
CREATE x-[:Ran_In]->c
return x,p,c
```

>Displays all Candidates in Specific Political Party and their relationship to Party + Constituency

```cypher
MATCH (p:Party {name: 'Fine Gael'})
OPTIONAL MATCH (n:Candidate)-[:Is_In]->(p:Party)
OPTIONAL MATCH (n:Candidate)-[:Ran_In]->(c:Constituency)
RETURN n,p,c
```

## Queries
Summarise your three queries here.
Then explain them one by one in the following sections.

#### Query 1: List of Nodes with most relationships back to another Node.

>In the query below I want to find out the most Candidates running in Constituency.
>Next is finding out list of co-Candidates for each Constituency. 
>End goal is to find out which co-Candidate most frequently worked with Constituency that has most Runs from.

```cypher
MATCH (candidate:Candidate)-[:Ran_In]->(cons:Constituency) 
WITH candidate, COUNT(cons) as numberofcons, collect(cons) as constituencies
ORDER BY numberofcons DESC 
LIMIT 1
unwind constituencies as cons
MATCH (cocandidate:Candidate)-[:Ran_In]->cons
WHERE NOT (cocandidate = candidate)
RETURN cons, collect(cocandidate)
```

#### Query2: Display Candidate - Constituency - Party

>In the query below I want to show all candidates who Ran In specific(Longford–Westmeath) Constituency
>Then I'm matching Candidate with Party

```cypher
MATCH (c:Constituency) where c.name = 'Longford–Westmeath'
    OPTIONAL MATCH (x:Candidate)-[:Ran_In]->(c:Constituency)
    OPTIONAL MATCH (x:Candidate)-[:Is_In]->(p:Party)
RETURN c,x,p

```

#### Query three title
This query retreives the Bacon number of an actor...
```cypher
MATCH
	(Bacon)
RETURN
	Bacon;
```

## References
1. [Neo4J website](http://neo4j.com/), the website of the Neo4j database.
2. [StackOverflow](http://stackoverflow.com/questions/22346526/how-to-count-the-number-of-relationships-in-neo4j?rq=1), Michael Hunger
