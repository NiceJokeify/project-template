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

| Node          | Description                                                 |
| ------------- |:-----------------------------------------------------------:|
| Party         | Node representing Political Party created, displays the Name|
| Constituency  | Node representing the are Candidate ran in from. Includes the name, seats and the population of the Constituency|
| Candidate     | Node representing the Candidate. Includes the name of the candidate.|


## Queries
Summarise your three queries here.
Then explain them one by one in the following sections.

#### Query one title
This query retreives the Bacon number of an actor...
```cypher
MATCH
	(Bacon)
RETURN
	Bacon;
```

#### Query two title
This query retreives the Bacon number of an actor...
```cypher
MATCH
	(Bacon)
RETURN
	Bacon;
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