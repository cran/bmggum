## ---- include = FALSE---------------------------------------------------------
library(bmggum)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.align = "center",
  fig.height = 4,
  fig.width = 6
)

## ---- echo=FALSE--------------------------------------------------------------
# Response data
#>GGUM.Data <- c(1,4,4,1,2,1,1,3,1,1,4,1,1,3,1,1,NA,2,NA,3,4,2,2,1,3,2,NA,2,1,1,2,1,NA,NA,NA,1,3,NA,1,4)
#>GGUM.Data <- matrix(GGUM.Data,nrow = 10)

## ---- echo=FALSE--------------------------------------------------------------
# delindex
#>delindex <- c(1,-1,2,1,3,-1,4,1)
#>delindex <- matrix(delindex,nrow = 2)

## ---- echo=FALSE--------------------------------------------------------------
# ind
#>ind <- c(1,1,2,2)
#>ind <- t(ind)

## ---- echo=FALSE--------------------------------------------------------------
# covariate
#>covariate <- c(0.70, -1.25, 0.48, -0.47, 0.86, 1.25, 1.17, -1.35, -0.84, -0.55)

## ---- warning = FALSE---------------------------------------------------------
# Fit the MGGUM model
#>mod <- bmggum(GGUM.Data=GGUM.Data, delindex=delindex, trait=2, ind=ind, option=4, model="UM8", covariate=covariate)
#>mod

## -----------------------------------------------------------------------------
# Extract theta estimates 
#>theta <- extract(x=mod, pars='theta')
#>theta
# Turn theta estimates into p*trait matrix where p equals sample size and trait equals the number of latent traits
#>theta <- theta[,1]
# nrow=trait
#>theta <- matrix(theta, nrow=2, byrow = TRUE)  
#>theta <- t(theta)
# theta estimates in p*trait matrix format
#>theta


# Extract tau estimates 
#>tau <- extract(x=mod, pars='tau')
#>tau
# Turn the tau estimates into I*(option-1) matrix where I equals the number of items and option equals the number of response options
#>tau <- tau[,1]
# nrow=option-1
#>tau <- matrix(tau, nrow=3, byrow = TRUE)  
#>tau <- t(tau)
# tau estimates in I*(option-1) matrix format
#>tau


# Extract lambda estimates 
#>lambda <- extract(x=mod, pars='lambda')
# lambda[1,1] is the coefficient linking person covariate 1 to latent trait 1
# lambda[1,2] is the coefficient linking person covariate 1 to latent trait 2
#>lambda

## -----------------------------------------------------------------------------
# Obtain the model fit statistic loo
#>loo <- modfit(mod)
#>loo

# Obtain the model fit statistic waic 
#>waic <- modfit(x=mod, index='waic')
#>waic

## -----------------------------------------------------------------------------
# Obtain density plots for all alphas. 
#>bayesplot(x=mod, pars='alpha', plot='density', inc_warmup=FALSE)

## -----------------------------------------------------------------------------
# Obtain trace plots for the discrimination parameter of the first two items (alpha[1] and alpha[2]).
#>bayesplot(x=mod, pars=paste0("alpha[",1:2,"]"), plot='trace', inc_warmup=FALSE)

## -----------------------------------------------------------------------------
# Obtain item plots with ORCs for all items. 
#>itemplot(x=mod)

## -----------------------------------------------------------------------------
# Obtain item plots with ORCs for item 2, 3, 4.
#>itemplot(x=mod, items = 2:4)

