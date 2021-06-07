using HetaSimulator, Plots

p = load_platform("./alco");
m = p.models[:nameless]

res = sim(m; tspan = (0.0, 100.0))
plot(res)

# load data

conditions = read_conditions("./alco/conditions.csv")
add_conditions!(p, conditions)

measurements = read_measurements("./alco/saturation_C1.csv")
add_measurements!(p, measurements)

p |> sim |> plot

# fitting

