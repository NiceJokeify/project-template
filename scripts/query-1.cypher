// In the query below I want to find out the most Candidates running in Constituency.
// Next is finding out list of co-Candidates for each Constituency. 
// End goal is to find out which co-Candidate most frequently worked with Constituency that has most Runs from.


MATCH (candidate:Candidate)-[:Ran_In]->(cons:Constituency) 
WITH candidate, COUNT(cons) as numberofcons, collect(cons) as constituencies
ORDER BY numberofcons DESC 
LIMIT 1
unwind constituencies as cons
MATCH (cocandidate:Candidate)-[:Ran_In]->cons
WHERE NOT (cocandidate = candidate)
RETURN cons, collect(cocandidate)
