# HistoryMatching_ExeterUQ

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/homerdurand/HistoryMatching_ExeterUQ/HEAD)

## Requirements

The R jupyter notebooks used for history matching use some python libraries (sklearn, skoptimize, numpy). In order to use them we recommand installing them in a conda environnement. You can use the *requirements.R* script for this purpose. It will install all required python libraries.

Installing requirements with *requirements.R* :

```console
Rscript requirements.R [env_name] 
```

will create a conda env named *env_name*. If you do not specify *env_name* 
```console
Rscript requirements.R 
```

will create a conda env named *env-HM* which is automatically load in the R notebooks that needs the python libraries *sklearn*, *skoptimize* and *numpy*. 

The *requirements.R*, when executing, also install the R libraries needed for the majority of R jupyter notebook used for History Matching. 

## Notebooks

Notebooks description
