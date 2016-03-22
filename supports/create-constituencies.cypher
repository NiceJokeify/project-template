// This query creates nodes representing all constituencies in Ireland.


CREATE	(:Constituency {name:'Carlow–Kilkenny', population: '145,659', seats:'5'})
,	(:Constituency {name:'Cavan–Monaghan', population: '120,483', seats:'4'})
,	(:Constituency {name:'Clare', population: '111,336', seats:'4'})
,	(:Constituency {name:'Cork East', population: '114,365', seats:'4'})
,	(:Constituency {name:'Cork North–Central', population: '117,170', seats:'4'})
,	(:Constituency {name:'Cork North–West', population: '86,593', seats:'3'})
,	(:Constituency {name:'Cork South–Central', population: '117,952', seats:'4'})
,	(:Constituency {name:'Cork South–West', population: '82,952', seats:'3'})
,	(:Constituency {name:'Donegal', population: '152,358',seats:'5'})
,	(:Constituency {name:'Dublin Bay North', population: '146,512', seats:'5'})
,	(:Constituency {name:'Dublin Bay South', population: '116,396', seats:'4'})
,	(:Constituency {name:'Dublin Central', population: '89,030', seats:'3'})
,	(:Constituency {name:'Dublin Fingal', population: '141,162', seats:'5'})
,	(:Constituency {name:'Dublin Mid–West', population: '110,427', seats:'4'})
,	(:Constituency {name:'Dublin North–West', population: '90,534', seats:'3'})
,	(:Constituency {name:'Dublin Rathdown', population: '87,470', seats:'3'})
,	(:Constituency {name:'Dublin South–Central', population: '114,660', seats:'4'})
,	(:Constituency {name:'Dublin South–West', population: '144,908', seats:'5'})
,	(:Constituency {name:'Dublin West', population: '113,179', seats:'4'})
,	(:Constituency {name:'Dún Laoghaire', population: '118,791', seats:'4'})
,	(:Constituency {name:'Galway East', population: '89,564', seats:'3'})
,	(:Constituency {name:'Galway West', population: '150,874', seats:'5'})
,	(:Constituency {name:'Kerry', population: '145,502', seats:'5'})
,	(:Constituency {name:'Kildare North', population: '115,350', seats:'4'})
,	(:Constituency {name:'Kildare South', population: '115,350', seats:'3'})
,	(:Constituency {name:'Laois', population: '87,745', seats:'3'})
,	(:Constituency {name:'Limerick City', population: '113,835', seats:'4'})
,	(:Constituency {name:'Limerick County', population: '83,834', seats:'3'})
,	(:Constituency {name:'Longford–Westmeath', population: '116,802', seats:'4'})
,	(:Constituency {name:'Louth', population: '143,272', seats:'5'})
,	(:Constituency {name:'Mayo', population: '120,332', seats:'4'})
,	(:Constituency {name:'Meath East', population: '86,572', seats:'3'})
,	(:Constituency {name:'Meath West', population: '85,550', seats:'3'})
,	(:Constituency {name:'Offaly', population: '87,640', seats:'3'})
,	(:Constituency {name:'Roscommon–Galway', population: '84,586', seats:'3'})
,	(:Constituency {name:'Sligo–Leitrim', population: '119,153', seats:'4'})
,	(:Constituency {name:'Tipperary', population: '147,801', seats:'5'})
,	(:Constituency {name:'Waterford', population: '113,795', seats:'4'})
,	(:Constituency {name:'Wexford', population: '145,320', seats:'5'})
,	(:Constituency {name:'Wicklow', population: '141,012', seats:'5'})


.......................::::::::::::::::::::::::::::::: POLITICAL PARTIES::::::::::::::::::::::::::::::::::.....................................

CREATE
	(:Party {name:'Fine Gael'})
	,	(:Party {name:'Renua Ireland'})
	,	(:Party {name:'Labour'})
	,	(:Party {name:'Fianna Fail'})
	,	(:Party {name:'Social Democrats'})
	,	(:Party {name:'Sinn Fein'})
	,	(:Party {name:'WUAG'})
	,	(:Party {name:'AAA'})
	,	(:Party {name:'Independents'})
	,	(:Party {name:'Green Party'})
	,	(:Party {name:'Irish Democratic Party'})
	,	(:Party {name:'Peoples Convention'})
	,	(:Party {name:'Workers Party'})
	,	(:Party {name:'Communist Party'})
	,	(:Party {name:'Fis Nua'})
	,	(:Party {name:'Direct Democracy'})
	,	(:Party {name:'Catholic Democrats'})
	
	
	
	
	///////////CANDIDATES///////////
	
	CREATE (:Candidate {name: 'Pat Deering'}) //creates a node named Pat Deering
	
		MATCH (x:Candidate) WHERE x.name = 'Pat Deering' RETURN x // returns Pat Deering 
	
		
		///////////Matches a node, party and a constituency and creates 2 relationships///////////
		MATCH (x:Candidate) WHERE x.name = 'Pat Deering' 
		OPTIONAL MATCH (p:Party) WHERE p.name = 'Fine Gael'
		OPTIONAL MATCH (c:Constituency) WHERE c.name = 'Carlow–Kilkenny'
		CREATE x-[:Is_In]->p
		CREATE x-[:Ran_In]->c
		return x,p,c
		
		
				
		///////////Matches candidate with political party///////////
		match (n:Candidate) where n.name = 'David Fitzgerald'
		Optional match (n:Candidate)-[:Is_In]->(p:Party)
		return n,p
				
				
		///////////Matches candidate with constituency the candidate ran in///////////
		match (n:Candidate) where n.name = 'David Fitzgerald'
		Optional match (n:Candidate)-[:Ran_In]->(p:Constituency)
		return n,p

		
		
		///////////MATCHES candidates, party, constituency///////////
		MATCH (p:Party {name: 'Fine Gael'})
		OPTIONAL MATCH (n:Candidate)-[:Is_In]->(p:Party)
		OPTIONAL MATCH (n:Candidate)-[:Ran_In]->(c:Constituency)
		RETURN n,p,c
		
		///////////DELETES candidate and all its relationships///////////
		MATCH (n { name:'Pat Deering' })
		DETACH DELETE n
		
		///////////shows candidate(check id)///////////
		MATCH (c:Candidate {name: 'Peter Fitzpatrick'})
		RETURN c
		
		
		////////Check Queries///////////
		.....::::Matches Party with its candidate and constituency he ran in from::::::::...............
		MATCH (p:Party {name: 'Fine Gael'})
		OPTIONAL MATCH (n:Candidate)-[:Is_In]->(p:Party)
		OPTIONAL MATCH (n:Candidate)-[:Ran_In]->(c:Constituency)
		RETURN n,p,c
		
		///////////matches party with candidates from that party///////////
		MATCH (p:Party {name: 'Fine Gael'})
		OPTIONAL MATCH (n:Candidate)-[:Is_In]->(p:Party)
		RETURN n,p
		
		
		
		
		
		
