using SimSolver, Plots, CSV

p = load_platform("./jak2stat5");

### Default run

simulate(p.models[:nameless], tspan = (0., 100.)) |> plot

### Load conditions

cond_csv = read_conditions_csv("./jak2stat5/Data/conditions.csv");
add_conditions!(p, cond_csv)

# chapter 2.3.1, page 21, figure S11 => task1
dts1_csv = read_measurements_csv("./jak2stat5/Data/JAK2STAT5_CFUE_Long_log10-mod.csv");
add_measurements!(p, dts1_csv)

# chapter 2.3.2, page 23, figure S12
dts2_csv = read_measurements_csv("./jak2stat5/Data/JAK2STAT5_CFUE_Concentrations_log10-mod.csv");
add_measurements!(p, dts2_csv)

# chapter 2.3.3, page 23, figure S12
dts3_csv = read_measurements_csv("./jak2stat5/Data/JAK2STAT5_CFUE_RNA_log10-mod.csv");
add_measurements!(p, dts3_csv)

# chapter 2.3.4
# chapter 2.3.5
# chapter 2.3.6
# chapter 2.3.7
# chapter 2.3.8
# chapter 2.3.9
# chapter 2.3.10
# chapter 2.3.11
# chapter 2.3.12
# chapter 2.3.13

simulate(p) |> plot
