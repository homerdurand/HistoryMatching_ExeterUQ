Emulators <- function(inputs, outputs){

  ###Establish and fit the Random Forest###
  d <- dim(outputs)[[2]]
  morf <- lapply(1:d, function(u) randomForest(x=inputs, y=outputs[, u], keep.inbag=TRUE))
  
  return(list(morf = morf, n_emulators=d))
}
 
morf.predict <- function(emulators, inputs){
    stds <- sapply(1:emulators$n_emulators, function(u) predict(emulators$morf[[u]], inputs, what=sd))
    means <- sapply(1:emulators$n_emulators, function(u) predict(emulators$morf[[u]], inputs, what=mean))
    return(list(mean = means, sd = stds))
}