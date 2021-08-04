require(reticulate)

#Installing R libs
packages <- c("future.apply", 'tgp', 'ANN2', 'MLmetrics', 'keras')
# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())

if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# create a new environment 
#!/usr/bin/env Rscript
env_name = commandArgs(trailingOnly=TRUE)
if(length(env_name)==0){
	env_name <- 'env-HM'
}

conda_create(env_name)

# # install required libraries
conda_install(env_name, "numpy")
conda_install(env_name, "scikit-learn")
conda_install(env_name, "scikit-optimize")
print("conda env have been created !")
print("HM lilbs have correctly been installed !")
print(paste0("You can use the env ",env_name," in your R scipt and R notebooks with :"))
print(paste0("use_virtualenv('",env_name,"')"))


