compute_NROY <- function(emulators, NewData, tObs, tObsErr, tDisc, em_type='MOGP'){
    NROY_em <- 1:nrow(NewData)
    for (em in emulators){
        if(em_type=='MOGP'){
            imp_em <- ImplausibilityMOGP(NewData=NewData, Emulator=em, Discrepancy=tDisc, Obs=tObs, ObsErr=tObsErr)
        }
        else if(em_type=='RF'){
            imp_em <- ImplausibilityMORF(NewData=NewData, Emulator=em, Discrepancy=tDisc, Obs=tObs, ObsErr=tObsErr)
        }
        NROY_temp <- which(rowSums(imp_em <= cutoff) >= length(tDisc) - valmax)
        NROY_em <- intersect(NROY_em, NROY_temp)
    }
    return(NROY_em)
}
parameters_space <- function(emulators, NewData, tObs, tObsErr, tDisc, em_type='MOGP', n_samples=n_samples){
    NROY_em <- compute_NROY(emulators, NewData, tObs, tObsErr, tDisc, em_type=em_type)
    return(sample(NROY_em, n_samples))
}