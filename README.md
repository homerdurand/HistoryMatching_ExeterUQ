# HistoryMatching_ExeterUQ

## Requirements

The R jupyter notebooks used for history matching use some python libraries (sklearn, skoptimize, numpy). In order to use them we recommand installing them in a conda environnement. You can use the *requirements.R* script for this purpose. It will install all required python libraries.

Installing requirements with *requirements.R* :

{ Rscript requirements.R [env_name] }

will create a conda env named *env_name*. If you do not specify *env_name* 
{ Rscript requirements.R }

you create a conda env named *env-HM* which is automatically load in the R notebooks that needs the python libraries *sklearn*, *skoptimize* and *numpy*. 

## Notebooks

Notebooks description