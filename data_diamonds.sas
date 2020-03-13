PROC IMPORT  
DATAFILE= "C:\Users\adadi\Desktop\data_diamonds_complete.csv" 
out=base DBMS=csv REPLACE;
GETNAMES=YES;
RUN;

proc summary data=base; 
run;

proc means data=base ;
var carat depth fdepth length table width  price;
run;

 
data trav; set base;

lprice=log(price);

proc reg; 
model price = carat depth fdepth length table width /spec white ;
run;

proc reg; 
model lprice= carat depth fdepth length table width /spec white  ;
run;


%let cost = price;
%let charac = carat depth fdepth length table width;


 data trav1; set trav;
   ods graphics on;

proc pls method=pls plots=all censcale details nfac=2 ;
/* diagnostics dmod fit parmprofiles scores vip 
weights xloadingplot xloadingprofiles xscores xweightplot xweightprofile xyscores yscores yweightplot varss*/;
model &cost=&charac;
run;

proc pls method=pls plots=all censcale details ;
/* diagnostics dmod fit parmprofiles scores vip 
weights xloadingplot xloadingprofiles xscores xweightplot xweightprofile xyscores yscores yweightplot varss*/;
model &cost=&charac;
run;



/* autre méthode pour PLS*/
proc pls method=pls (algorithm = nipals) data=base cv=split cvtest (seed=12345)details plots=all;
class clarity color cut ;
model price= carat clarity color cut depth fdepth length table width/solution;
run;

proc pls method=rrr (algorithm = nipals) data=base cv=split cvtest (seed=12345)details plots=all;
class clarity color cut ;
model price= carat clarity color cut depth fdepth length table width/solution;
run;


proc pls method=pcr (algorithm = nipals) data=base cv=split cvtest (seed=12345)details plots=all;
model price= carat depth fdepth length table width/solution;
run;

   ods graphics off;
