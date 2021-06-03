using HetaSimulator, Plots

p = load_platform("./jak2stat5");

### test run

sim(p.models[:nameless], tspan = (0., 100.)) |> plot

### Load conditions

cond_csv = read_conditions("./jak2stat5/Data/conditions.csv")
add_conditions!(p, cond_csv)

# chapter 2.3.1, page 21, figure S11 => task1
dts1_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_Long_log10-mod.csv");
add_measurements!(p, dts1_csv)

# chapter 2.3.2, page 23, figure S12
dts2_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_Concentrations_log10-mod.csv");
add_measurements!(p, dts2_csv)

# chapter 2.3.3, page 25, figure S13
dts3_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_RNA_log10-mod.csv");
add_measurements!(p, dts3_csv)

# chapter 2.3.4, page 28, figure S14
dts4_0_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_ActD0_log10-mod.csv");
dts4_1_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_ActD1_log10-mod.csv");
add_measurements!(p, dts4_0_csv)
add_measurements!(p, dts4_1_csv)

# chapter 2.3.5, page 31, figure S15
dts5_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_Fine_log10-mod.csv");
add_measurements!(p, dts5_csv)

# chapter 2.3.6, page 34, figure S16
dts6_0_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_CISoe0_log10-mod.csv");
dts6_1_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_CISoe1_log10-mod.csv");
add_measurements!(p, dts6_0_csv)
add_measurements!(p, dts6_1_csv)

# chapter 2.3.7, page 36, figure S17
dts7_0_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_CISoe_pEpoR0_log10-mod.csv");
dts7_1_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_CISoe_pEpoR1_log10-mod.csv");
add_measurements!(p, dts7_0_csv)
add_measurements!(p, dts7_1_csv)

# chapter 2.3.8, page 38, figure S18
dts8_0_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_SOCS3oe0_log10-mod.csv");
dts8_1_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_SOCS3oe1_log10-mod.csv");
add_measurements!(p, dts8_0_csv)
add_measurements!(p, dts8_1_csv)

# chapter 2.3.9, page 40, figure S19
dts9_0_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_SHP1oe0_log10-mod.csv");
dts9_1_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_SHP1oe1_log10-mod.csv");
add_measurements!(p, dts9_0_csv)
add_measurements!(p, dts9_1_csv)

# chapter 2.3.10, page 42, figure S20
# chapter 2.3.11, page 44, figure S21
# chapter 2.3.12, page 46, figure S22
# chapter 2.3.13, page 48, figure S23

sim(p) |> plot # CVODE_BDF()
