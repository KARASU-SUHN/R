
#rDEA: Data Envelopment Analysis (DEA) package for R, estimating robust DEA scores without and with environmental variables and doing returns-to-scale tests.
##Robust DEA (Simar and Wilson, 1998) with input model with included Japan hospital data

library(rDEA)
## loading Japan hospital data
data("hospitals", package="rDEA")

## choosing inputs and outputs for analysis
firms = 1:50
Y = hospitals[firms, c('inpatients', 'outpatients')]
X = hospitals[firms, c('labor', 'capital')]

## Robust DEA with 1000 bootstrap iterations and variable returns-to-scale
di = dea.robust(X=X, Y=Y, model="input", RTS="variable", B=1000)

## robust estimates of technical efficiency for each hospital
di$theta_hat_hat


######   dea: Data envelopment analysis scores
#Naive scores in input-oriented, output-oriented and cost-minimization DEA models

# NOT RUN {
## load data on Japanese hospitals (Besstremyannaya 2013, 2011)
data("hospitals", package="rDEA")

## inputs and outputs for analysis
Y = hospitals[c('inpatients', 'outpatients')]
X = hospitals[c('labor', 'capital')]
W = hospitals[c('labor_price', 'capital_price')]

## Naive input-oriented DEA score for the first 20 firms under variable returns-to-scale
firms=1:20
di_naive = dea(XREF=X, YREF=Y, X=X[firms,], Y=Y[firms,], model="input", RTS="variable")
di_naive$thetaOpt

## Naive DEA score in cost-minimization model for the first 20 firms under variable returns-to-scale
ci_naive = dea(XREF=X, YREF=Y, X=X[firms,], Y=Y[firms,], W=W[firms,],
               model="costmin", RTS="variable")
ci_naive$XOpt
ci_naive$gammaOpt

# }
