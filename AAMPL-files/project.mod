set NODES;
set ARCS within {NODES cross NODES};
set SIMULT within {NODES cross NODES};
param DUR{NODES};
var STARTTIME{j in NODES} >=0;
var TIME;

# Need to sum over all defined arcs, Duration[i,j] * X[i,j]
minimize z:
		TIME;
	
subject to c3 { i in NODES}:
		STARTTIME[i] + DUR[i] <= TIME;
		
subject to c4 { (i,j) in ARCS}:
		STARTTIME[i] + DUR[i] <= STARTTIME[j];
		
subject to c5 { (i,j) in SIMULT}:
		STARTTIME[i] = STARTTIME[j];
		
subject to z25 {i in NODES}:
		STARTTIME[25] >= STARTTIME[28] + DUR[28];
		
