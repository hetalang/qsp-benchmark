using HetaSimulator, Plots

################################## Model Upload ###########################################
p = load_platform("./boehm");
m = p.models[:nameless]

################################## Simple test simulation ######################################

sim(m, tspan = (0, 600)) |> plot

################################## Loading conditions and measurements ##########################

cond_df = read_conditions("./boehm/conditions.csv");
measurement_df = read_measurements("./boehm/measurements.csv");

add_conditions!(p, cond_df)
add_measurements!(p, measurement_df)

sim(p) |> plot

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

fit1 = fit(p, fit_cons; alg = CVODE_BDF()) # default algorithm doesn't work

################################## plot fitted #################

sim(p) |> plot # default
sim(p, parameters_upd = fit1.optim) |> plot # best fit
sim(p, parameters_upd = [:k_phos=>1000.]) |> plot # modified plot
