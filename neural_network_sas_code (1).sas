*------------------------------------------------------------*;
* EM Version: 14.2;
* SAS Release: 9.04.01M4P110916;
* Host: heinz-f21-043;
* Project Path: C:\Users\sushmitd\Desktop;
* Project Name: project;
* Diagram Id: EMWS1;
* Diagram Name: neural_network_sushmita;
* Generated by: sushmitd;
* Date: 13OCT2021:16:26:28;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Macro Variables;
*------------------------------------------------------------*;
%let EM_PROJECT =;
%let EM_PROJECTNAME =;
%let EM_WSNAME =;
%let EM_WSDESCRIPTION =neural_network_sushmita;
%let EM_SUMMARY =WORK.SUMMARY;
%let EM_NUMTASKS =SINGLE;
%let EM_EDITMODE =R;
%let EM_DEBUGVAL =;
%let EM_ACTION =run;
*------------------------------------------------------------*;
%macro em_usedatatable;
%if ^%symexist(EM_USEDATATABLE) %then %do;
%let EM_USEDATATABLE = Y;
%end;
%if "&EM_USEDATATABLE" ne "N" %then %do;
*------------------------------------------------------------*;
* Data Tables;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
%end;
%mend em_usedatatable;
%em_usedatatable;
*------------------------------------------------------------*;
* Create workspace data set;
*------------------------------------------------------------*;
data workspace;
length property $64 value $200;
property= 'PROJECTLOCATION';
value= "&EM_PROJECT";
output;
property= 'PROJECTNAME';
value= "&EM_PROJECTNAME";
output;
property= 'WORKSPACENAME';
value= "&EM_WSNAME";
output;
property= 'WORKSPACEDESCRIPTION';
value= "&EM_WSDESCRIPTION";
output;
property= 'SUMMARYDATASET';
value= "&EM_SUMMARY";
output;
property= 'NUMTASKS';
value= "&EM_NUMTASKS";
output;
property= 'EDITMODE';
value= "&EM_EDITMODE";
output;
property= 'DEBUG';
value= "&EM_DEBUGVAL";
output;
run;
*------------------------------------------------------------*;
* Create nodes data set;
*------------------------------------------------------------*;
data nodes;
length id $12 component $32 description $64 X 8 Y 8 diagramID $32 parentID $32;
id= "Part";
component="Partition";
description= "Data Partition";
diagramID="_ROOT_";
parentID="";
X=315;
Y=99;
output;
id= "Neural";
component="NeuralNetwork";
description= "Neural Network";
diagramID="_ROOT_";
parentID="";
X=510;
Y=99;
output;
id= "FIMPORT";
component="FileImport";
description= "File Import";
diagramID="_ROOT_";
parentID="";
X=119;
Y=98;
output;
id= "EMCODE";
component="SASCode";
description= "SAS Code";
diagramID="_ROOT_";
parentID="";
X=707;
Y=101;
output;
run;
*------------------------------------------------------------*;
* EMNOTES File for Part;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Part_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* Decmeta Data Set for Neural;
*------------------------------------------------------------*;
data WORK.Neural_satisfaction_DM;
  length   _TYPE_                           $ 32
           VARIABLE                         $ 32
           LABEL                            $ 256
           LEVEL                            $ 32
           EVENT                            $ 32
           ORDER                            $ 10
           FORMAT                           $ 32
           TYPE                             $ 1
           COST                             $ 32
           USE                              $ 1
           ;

  label    _TYPE_="Type"
           VARIABLE="Variable"
           LABEL="Label"
           LEVEL="Measurement Level"
           EVENT="Target Event"
           ORDER="Order"
           FORMAT="Format"
           TYPE="Type"
           COST="Cost"
           USE="Use"
           ;
_TYPE_="MATRIX";
VARIABLE="";
LABEL="";
LEVEL="PROFIT";
EVENT="";
ORDER="";
FORMAT="";
TYPE="";
COST="";
USE="N";
output;
_TYPE_="TARGET";
VARIABLE="satisfaction";
LABEL="satisfaction";
LEVEL="BINARY";
EVENT="SATISFIED";
ORDER="";
FORMAT="$12.";
TYPE="C";
COST="";
USE="";
output;
_TYPE_="DECISION";
VARIABLE="DECISION1";
LABEL="SATISFIED";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="Y";
output;
_TYPE_="DECISION";
VARIABLE="DECISION2";
LABEL="DISSATISFIED";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="Y";
output;
_TYPE_="DATAPRIOR";
VARIABLE="DATAPRIOR";
LABEL="Data Prior";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="N";
output;
_TYPE_="TRAINPRIOR";
VARIABLE="TRAINPRIOR";
LABEL="Training Prior";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="N";
output;
_TYPE_="DECPRIOR";
VARIABLE="DECPRIOR";
LABEL="Decision Prior";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="N";
output;
_TYPE_="PREDICTED";
VARIABLE="P_satisfactionsatisfied";
LABEL="Predicted: satisfaction=satisfied";
LEVEL="SATISFIED";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="RESIDUAL";
VARIABLE="R_satisfactionsatisfied";
LABEL="Residual: satisfaction=satisfied";
LEVEL="SATISFIED";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="PREDICTED";
VARIABLE="P_satisfactiondissatisfied";
LABEL="Predicted: satisfaction=dissatisfied";
LEVEL="DISSATISFIED";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="RESIDUAL";
VARIABLE="R_satisfactiondissatisfied";
LABEL="Residual: satisfaction=dissatisfied";
LEVEL="DISSATISFIED";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="FROM";
VARIABLE="F_satisfaction";
LABEL="From: satisfaction";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="C";
COST="";
USE="";
output;
_TYPE_="INTO";
VARIABLE="I_satisfaction";
LABEL="Into: satisfaction";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="C";
COST="";
USE="";
output;
;
run;
*------------------------------------------------------------*;
* Decdata Data Set for Neural;
*------------------------------------------------------------*;
data WORK.Neural_satisfaction_DD;
  length   satisfaction                     $ 32
           COUNT                              8
           DATAPRIOR                          8
           TRAINPRIOR                         8
           DECPRIOR                           8
           DECISION1                          8
           DECISION2                          8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="SATISFIED"
           DECISION2="DISSATISFIED"
           ;
  format   COUNT 10.
           ;
satisfaction="SATISFIED";
COUNT=49760;
DATAPRIOR=0.5473244239;
TRAINPRIOR=0.54732442391244;
DECPRIOR=.;
DECISION1=1;
DECISION2=0;
output;
satisfaction="DISSATISFIED";
COUNT=41155;
DATAPRIOR=0.4526755761;
TRAINPRIOR=0.45267557608755;
DECPRIOR=.;
DECISION1=0;
DECISION2=1;
output;
;
run;
*------------------------------------------------------------*;
* EMNOTES File for Neural;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Neural_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* Variable Attributes for FIMPORT;
*------------------------------------------------------------*;
data WORK.FIMPORT_VariableAttribute;
length Variable $64 AttributeName $32 AttributeValue $64;
Variable='ID';
AttributeName="ROLE";
AttributeValue='REJECTED';
Output;
Variable='satisfaction';
AttributeName="ROLE";
AttributeValue='TARGET';
Output;
Variable='satisfaction';
AttributeName="LEVEL";
AttributeValue='BINARY';
Output;
run;
*------------------------------------------------------------*;
* USERTRAINCODE File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_USERTRAINCODE.sas";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
run;
*------------------------------------------------------------*;
* VARIABLESETDELTA File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_VARIABLESETDELTA.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
put 'if NAME="ID" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="NOMINAL";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
put 'if NAME="satisfaction" then do;';
put 'ROLE="TARGET";';
put 'LEVEL="BINARY";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
run;
*------------------------------------------------------------*;
* DELTACODE File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_DELTACODE.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
put 'if NAME="ID" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="NOMINAL";';
put 'ORDER="";';
put 'end;';
put 'if NAME="satisfaction" then do;';
put 'ROLE="TARGET";';
put 'LEVEL="BINARY";';
put 'ORDER="";';
put 'end;';
put 'drop DROP;';
run;
*------------------------------------------------------------*;
* EMNOTES File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* USERTRAINCODE File for EMCODE;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"EMCODE_USERTRAINCODE.sas";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
run;
*------------------------------------------------------------*;
* EMNOTES File for EMCODE;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"EMCODE_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* Create node properties data set;
*------------------------------------------------------------*;
data nodeprops;
length id $12 property $64 value $400;
id= "Part";
property="Method";
value= "DEFAULT";
output;
id= "Part";
property="TrainPct";
value= "70";
output;
id= "Part";
property="ValidatePct";
value= "20";
output;
id= "Part";
property="TestPct";
value= "10";
output;
id= "Part";
property="RandomSeed";
value= "12345";
output;
id= "Part";
property="OutputType";
value= "DATA";
output;
id= "Part";
property="IntervalDistribution";
value= "Y";
output;
id= "Part";
property="ClassDistribution";
value= "Y";
output;
id= "Part";
property="ForceRun";
value= "N";
output;
id= "Part";
property="RunAction";
value= "Train";
output;
id= "Part";
property="Component";
value= "Partition";
output;
id= "Part";
property="EM_FILE_EMNOTES";
value= "Part_EMNOTES.txt";
output;
id= "Neural";
property="UseEstimates";
value= "N";
output;
id= "Neural";
property="NetworkArchitecture";
value= "MLP";
output;
id= "Neural";
property="DirectConnection";
value= "N";
output;
id= "Neural";
property="Hidden";
value= "64";
output;
id= "Neural";
property="Prelim";
value= "Y";
output;
id= "Neural";
property="PreliminaryRuns";
value= "5";
output;
id= "Neural";
property="PrelimMaxiter";
value= "10";
output;
id= "Neural";
property="PrelimMaxTime";
value= "1 HOUR";
output;
id= "Neural";
property="Maxiter";
value= "300";
output;
id= "Neural";
property="Maxtime";
value= "4 HOURS";
output;
id= "Neural";
property="TrainingTechnique";
value= "BPROP";
output;
id= "Neural";
property="ConvDefaults";
value= "Y";
output;
id= "Neural";
property="AbsConvValue";
value= "-1.34078E154";
output;
id= "Neural";
property="AbsFValue";
value= "0";
output;
id= "Neural";
property="AbsFTime";
value= "1";
output;
id= "Neural";
property="AbsGValue";
value= "0.00001";
output;
id= "Neural";
property="AbsGTime";
value= "1";
output;
id= "Neural";
property="AbsXValue";
value= "1E-8";
output;
id= "Neural";
property="AbsXTime";
value= "1";
output;
id= "Neural";
property="FConvValue";
value= "0";
output;
id= "Neural";
property="FConvTime";
value= "1";
output;
id= "Neural";
property="GConvValue";
value= "1E-6";
output;
id= "Neural";
property="GConvTime";
value= "1";
output;
id= "Neural";
property="ModelSelectionCriterion";
value= "MISCLASSIFICATION";
output;
id= "Neural";
property="SuppressOutput";
value= "N";
output;
id= "Neural";
property="Residuals";
value= "Y";
output;
id= "Neural";
property="Standardizations";
value= "N";
output;
id= "Neural";
property="HiddenUnits";
value= "N";
output;
id= "Neural";
property="TrainCode";
value= "";
output;
id= "Neural";
property="PrelimOutest";
value= "";
output;
id= "Neural";
property="Outest";
value= "";
output;
id= "Neural";
property="Outfit";
value= "";
output;
id= "Neural";
property="InitialDs";
value= "";
output;
id= "Neural";
property="CodefileRes";
value= "";
output;
id= "Neural";
property="CodefileNoRes";
value= "";
output;
id= "Neural";
property="AddHidden";
value= "Y";
output;
id= "Neural";
property="HiddenCombFunction";
value= "DEFAULT";
output;
id= "Neural";
property="HiddenActivation";
value= "DEFAULT";
output;
id= "Neural";
property="HiddenBias";
value= "Y";
output;
id= "Neural";
property="TargetCombFunction";
value= "DEFAULT";
output;
id= "Neural";
property="TargetActivation";
value= "DEFAULT";
output;
id= "Neural";
property="TargetError";
value= "DEFAULT";
output;
id= "Neural";
property="TargetBias";
value= "Y";
output;
id= "Neural";
property="InitialSeed";
value= "12345";
output;
id= "Neural";
property="RandDist";
value= "NORMAL";
output;
id= "Neural";
property="RandScale";
value= "0.1";
output;
id= "Neural";
property="RandLoc";
value= "0";
output;
id= "Neural";
property="InputStandardization";
value= "STD";
output;
id= "Neural";
property="WeightDecay";
value= "0";
output;
id= "Neural";
property="Accelerate";
value= "1.2";
output;
id= "Neural";
property="Decelerate";
value= "0.5";
output;
id= "Neural";
property="Learn";
value= "0.1";
output;
id= "Neural";
property="MaxLearn";
value= "50";
output;
id= "Neural";
property="MinLearn";
value= "0.00001";
output;
id= "Neural";
property="Momentum";
value= "0";
output;
id= "Neural";
property="MaxMomentum";
value= "1.75";
output;
id= "Neural";
property="Tilt";
value= "0";
output;
id= "Neural";
property="ForceRun";
value= "N";
output;
id= "Neural";
property="RunAction";
value= "Train";
output;
id= "Neural";
property="Component";
value= "NeuralNetwork";
output;
id= "Neural";
property="EM_DECMETA_satisfaction";
value= "WORK.Neural_satisfaction_DM";
output;
id= "Neural";
property="EM_DECDATA_satisfaction";
value= "WORK.Neural_satisfaction_DD";
output;
id= "Neural";
property="EM_FILE_EMNOTES";
value= "Neural_EMNOTES.txt";
output;
id= "FIMPORT";
property="Location";
value= "CATALOG";
output;
id= "FIMPORT";
property="Catalog";
value= "SASHELP.EMSAMP.FIMPORT.SOURCE";
output;
id= "FIMPORT";
property="ImportType";
value= "Local";
output;
id= "FIMPORT";
property="GuessRows";
value= "500";
output;
id= "FIMPORT";
property="Delimiter";
value= ",";
output;
id= "FIMPORT";
property="NameRow";
value= "Y";
output;
id= "FIMPORT";
property="SkipRows";
value= "0";
output;
id= "FIMPORT";
property="MaxRows";
value= "1000000";
output;
id= "FIMPORT";
property="MaxCols";
value= "10000";
output;
id= "FIMPORT";
property="FileType";
value= "xlsx";
output;
id= "FIMPORT";
property="Role";
value= "TRAIN";
output;
id= "FIMPORT";
property="ForceRun";
value= "N";
output;
id= "FIMPORT";
property="Summarize";
value= "N";
output;
id= "FIMPORT";
property="AdvancedAdvisor";
value= "N";
output;
id= "FIMPORT";
property="RunAction";
value= "Train";
output;
id= "FIMPORT";
property="Component";
value= "FileImport";
output;
id= "FIMPORT";
property="IFileName";
value= "C:\Users\sushmitd\Downloads\airlines_final.xlsx";
output;
id= "FIMPORT";
property="AccessTable";
value= "NoTableName";
output;
id= "FIMPORT";
property="UserID";
value= "NoUserID";
output;
id= "FIMPORT";
property="Password";
value= "NoPassword";
output;
id= "FIMPORT";
property="ToolType";
value= "SAMPLE";
output;
id= "FIMPORT";
property="ToolPrefix";
value= "FIMPORT";
output;
id= "FIMPORT";
property="EM_VARIABLEATTRIBUTES";
value= "WORK.FIMPORT_VariableAttribute";
output;
id= "FIMPORT";
property="EM_FILE_USERTRAINCODE";
value= "FIMPORT_USERTRAINCODE.sas";
output;
id= "FIMPORT";
property="EM_FILE_VARIABLESETDELTA";
value= "FIMPORT_VARIABLESETDELTA.txt";
output;
id= "FIMPORT";
property="EM_FILE_DELTACODE";
value= "FIMPORT_DELTACODE.txt";
output;
id= "FIMPORT";
property="EM_FILE_EMNOTES";
value= "FIMPORT_EMNOTES.txt";
output;
id= "EMCODE";
property="UsePriors";
value= "Y";
output;
id= "EMCODE";
property="ToolType";
value= "UTILITY";
output;
id= "EMCODE";
property="DataNeeded";
value= "N";
output;
id= "EMCODE";
property="PublishCode";
value= "PUBLISH";
output;
id= "EMCODE";
property="ScoreCodeFormat";
value= "DATASTEP";
output;
id= "EMCODE";
property="MetaAdvisor";
value= "BASIC";
output;
id= "EMCODE";
property="ForceRun";
value= "N";
output;
id= "EMCODE";
property="RunAction";
value= "Train";
output;
id= "EMCODE";
property="Component";
value= "SASCode";
output;
id= "EMCODE";
property="ToolPrefix";
value= "EMCODE";
output;
id= "EMCODE";
property="EM_FILE_USERTRAINCODE";
value= "EMCODE_USERTRAINCODE.sas";
output;
id= "EMCODE";
property="EM_FILE_EMNOTES";
value= "EMCODE_EMNOTES.txt";
output;
run;
*------------------------------------------------------------*;
* Create connections data set;
*------------------------------------------------------------*;
data connect;
length from to $12;
from="Neural";
to="EMCODE";
output;
from="Part";
to="Neural";
output;
from="FIMPORT";
to="Part";
output;
run;
*------------------------------------------------------------*;
* Create actions to run data set;
*------------------------------------------------------------*;
%macro emaction;
%let actionstring = %upcase(&EM_ACTION);
%if %index(&actionstring, RUN) or %index(&actionstring, REPORT) %then %do;
data actions;
length id $12 action $40;
id="EMCODE";
%if %index(&actionstring, RUN) %then %do;
action='run';
output;
%end;
%if %index(&actionstring, REPORT) %then %do;
action='report';
output;
%end;
run;
%end;
%mend;
%emaction;
*------------------------------------------------------------*;
* Execute the actions;
*------------------------------------------------------------*;
%em5batch(execute, workspace=workspace, nodes=nodes, connect=connect, datasources=datasources, nodeprops=nodeprops, action=actions);
