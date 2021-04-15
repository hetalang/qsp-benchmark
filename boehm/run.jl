using SimSolver, Plots
using CSV, DataFrames

################################## Model Upload ###########################################
p = load_platform("$SimSolverDir/cases/boehm");
model = p.models[:nameless]

################################## Single Simulation ######################################
sim = simulate(model, tspan = (0,300));
plot(sim)

################################## Fitting  ###############################################

measurements = read_measurements_csv("$SimSolverDir/cases/boehm/measurements.csv");

cond1 = Cond(model, tspan = (0,300));
add_measurements!(cond1, measurements)
simulate(cond1) |> plot
simulate(cond1; saveat_measurements = true) |> plot

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

fit1 = fit([cond1], fit_cons)
