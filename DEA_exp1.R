library(deaR)

data(package='deaR')
data_example=read_data(Coll_Blasco_2006, ni=2, no=2)
data("Economy")
View(Economy)
data('EconomyLong')
View(EconomyLong)

# read_malmquist() function with wide data format.
help("read_malmquist")

data_example_1 = read_malmquist(datadea=Economy, 
                                nper=5, arrangement="horizontal", 
                                ni=2,no=1)
data_example_2 = read_malmquist(datadea=EconomyLong, 
                                percol =2, arrangement="vertical", 
                                ni=2,no=1)
# read_data_fuzzy() function.
data('Leon2003')
View(Leon2003)
data_example_3 = read_data_fuzzy(datadea=Leon2003, inputs.mL=2,
                                  inputs.dL=3, outputs.mL=4, outputs.dL=5)
# Select and run a DEA model.

### Conventional DEA models
#Basic (radial) models (envelopment and multiplier forms) Directional distance function model
#(Weighted) Additive model
#Super‐efficiency additive model
#Radial Super‐efficiency model
#(Weighted) Non‐radial model
#Preference Structure model
#(Weighted) Slack‐based model
#(Weighted) Super‐efficiency slack‐based model
#Cross‐efficiency (crs12 and vrs13)
#Bootstrapping (Simar and Wilson algorithm) 
#FDH model

### Productivity
#Malmquist index

#Fuzzy DEA models
#Kao and Liu model14
#Possibilistic model
#Guo and Tanaka model
#Fuzzy cross‐efficiency15 (only crs)

help('model_basic')
data("PFT1981")
PFT <- PFT1981[1:49, ] 
data_basic=read_data(PFT1981,dmus = 1,inputs = 2:6,outputs = 7:9)
          
result_pft = model_basic(data_basic, dmu_ref=1:49, dmu_eval=1:49, orientation="io", rts="crs")

###efficiencies(): To extract the efficiency scores.

#slacks(): To extract input and output slacks.
#targets(): To extract the input and output target values.
#lambdas(): To extract the lambdas (or intensities).
#references(): To extract the reference set for inefficient DMUs.
#rts(): To extract the returns‐to‐scale.
#multipliers(): To extract the multipliers (or weights) of the multiplier DEA form.

efficiencies(result_pft)
references(result_pft)
slacks(result_pft)
targets(result_pft)
lambdas(result_pft)
rts(result_pft)






#exp2
data('Hua_Bian_2007')
#data_example_12=read_data(Hua_Bian_2007, ni=2, no=3,ud_outputs = 3)

#result_example_12=model_basic(data_example_12,orientation = "oo",rts = "vrs",vtrans_o = 1500 )
data_example_12 <- read_data(Hua_Bian_2007, 
                          ni = 2,
                          no = 3, 
                          ud_outputs = 3) 
# Translation parameter (vtrans_o) is set to 1500                          
result_example_12 <- model_basic(data_example_12, 
                      orientation = "oo", 
                      rts = "vrs", 
                      vtrans_o = 1500) 
# The third output is an undesirable output.
eff <- efficiencies(result_example_12)
1 / eff

summary(result_example_12)
plot(result_example_12)
#press enter to continue


data("Leon2003")
data_example = read_data_fuzzy(Leon2003,
                                dmus = 1, inputs.mL = 2, inputs.dL = 3, outputs.mL = 4, outputs.dL = 5)
result = modelfuzzy_possibilistic(data_example,
                                   h= seq(0, 1, by = 0.1),
                                   orientation = "io", rts = "vrs")
efficiencies(result)
summary(result)

#example15
data("EconomyLong")
data_example_15 = read_malmquist(EconomyLong, percol = 2,
                                  arrangement = "vertical", inputs = 3:4,
                                  outputs = 5)
result_malmquist = malmquist_index(data_example_15, orientation = "io")
plot(result_malmquist)

#example16
data("Golany_Roll_1989")
data_example = read_data(datadea = Golany_Roll_1989, dmus = 1,
                          inputs = 2:4, outputs = 5:6)
result_cross = cross_efficiency(data_example, orientation = "io",
                                 rts = "crs", selfapp = TRUE)
plot(result_cross)

