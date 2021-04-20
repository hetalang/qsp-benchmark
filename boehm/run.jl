using HetaSimulator, Plots

################################## Model Upload ###########################################
p = load_platform("./boehm");
# model = p.models[:nameless]

################################## Simple test simulation ######################################

sim_result0 = sim(p); # throws "at least one condition"

sim(p.models[:nameless], tspan = (0,1000)) |> plot

################################## Loading conditions and measurements ##########################

cond_csv = read_conditions_csv("./boehm/conditions.csv"); # XXX: model is not loaded
measurement_csv = read_measurements_csv("./boehm/measurements.csv");

add_conditions!(p, cond_csv) # XXX: condition print is bad
add_measurements!(p, measurement_csv)

sim(p) |> plot
sim(p; saveat_measurements = true) |> plot

################################ Fitting #######################

fit_cons = [
  :Epo_degradation_BaF3=>0.026982514033029,
  :k_exp_hetero=>0.0000100067973851508,
  :k_exp_homo=>0.006170228086381,
  :k_imp_hetero=>0.0163679184468,
  :k_imp_homo=>97749.3794024716,
  :k_phos=>15766.5070195731,
  :sd_pSTAT5A_rel=>3.85261197844677,
  :sd_pSTAT5B_rel=>6.59147818673419,
  :sd_rSTAT5A_rel=>3.15271275648527
]

fit1 = fit(p, fit_cons) # XXX: no progress, no statistics, no loss count, no solution

fit2 = fit(p, fit1.optim)

################################## plot fitted #################

sim(p) |> plot # default
sim(p, constants = fit1.optim) |> plot # best fit
sim(p, constants = [:k_phos=>1000.]) |> plot # modified plot 
