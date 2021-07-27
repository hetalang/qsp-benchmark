using HetaSimulator, Plots

p = load_platform("./alco");
m = p.models[:nameless]

res = sim(m; tspan = (0.0, 100.0), parameters = [:dose=>10.])
plot(res)

# load data

conditions_df = read_conditions("./alco/conditions.csv")
add_conditions!(p, conditions_df)

measurements_df = read_measurements("./alco/saturation_C1.csv")
add_measurements!(p, measurements_df)

p |> sim |> plot

# fitting

fit_params = [
    :Vd => 5.3,
    :kabs => 0.1,
    :Vmax => 0.2,
    :Km => 0.1,
    :sigma => 0.05
]

fit1 = fit(p, fit_params)

sim(p) |> plot # default
sim(p, parameters_upd = fit1.optim) |> plot # best fit
