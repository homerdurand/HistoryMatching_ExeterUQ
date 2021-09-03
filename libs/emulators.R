emulatorRF <- function(inputs, outputs, ntrees=100){
    em <- sklearn$ensemble$RandomForestRegressor(n_estimators=as.integer(ntrees))
    em$fit(inputs, outputs)
    return(em)
}

predictRF <- function(rf, x_test){
    n_estimators <- length(rf$estimators_)
    n_outputs <- rf$n_outputs_
    n_samples <- dim(x_test)[[1]]
    
    sum <- matrix(0, n_samples, n_outputs)
    sum_sq <- matrix(0, n_samples, n_outputs)
    preds <- future_lapply(rf$estimators_, function(tree) tree$predict(x_test), future.seed=NULL)
    for(u in seq(n_estimators)){
        sum <- sum + preds[[u]]
        sum_sq <- sum_sq + preds[[u]]**2
    }
    mean = sum/n_estimators
    var = (sum_sq - (sum**2) / n_estimators) / (n_estimators - 1)
    list(mean=mean, var=var)
}

ImplausibilityRF <- function(emulator, Xp, tObs, tObsErr, tDisc){
    preds <- predictRF(emulator, Xp)
    Timps <- future_sapply(1:length(tDisc), function(r) abs(tObs[[r]] - preds$mean[,r])/sqrt(preds$var[,r]+tObsErr[[r]]+tDisc[[r]]), future.seed=NULL)
    return(Timps)
}