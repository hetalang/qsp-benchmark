using HetaSimulator, Plots

p = load_platform("./jak2stat5");

### test run

sim(p.models[:nameless], tspan = (0., 100.), alg = CVODE_BDF()) |> plot

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
dts10_0_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR72.5e-9_log10-mod.csv");
dts10_1_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR72.5e-8_log10-mod.csv");
dts10_2_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR72.5e-7_log10-mod.csv");
dts10_3_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR72.5e-6_log10-mod.csv");
dts10_4_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR72.5e-5_log10-mod.csv");
add_measurements!(p, dts10_0_csv)
add_measurements!(p, dts10_1_csv)
add_measurements!(p, dts10_2_csv)
add_measurements!(p, dts10_3_csv)
add_measurements!(p, dts10_4_csv)

# chapter 2.3.11, page 44, figure S21
dts11_0_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR302.5e-9_log10-mod.csv"); # 0
dts11_1_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR302.5e-8_log10-mod.csv"); # 1
dts11_2_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR301.25e-7_log10-mod.csv"); # 2
dts11_3_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR302.5e-7_log10-mod.csv"); # 3
dts11_4_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR301.25e-6_log10-mod.csv"); # 4
dts11_5_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR302.5e-6_log10-mod.csv"); # 5
add_measurements!(p, dts11_0_csv)
add_measurements!(p, dts11_1_csv)
add_measurements!(p, dts11_2_csv)
add_measurements!(p, dts11_3_csv)
add_measurements!(p, dts11_4_csv)
add_measurements!(p, dts11_5_csv)

# chapter 2.3.12, page 46, figure S22
dts12_0_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR101.25e-8_log10-mod.csv"); # 1.25e-8 # 0
dts12_1_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR101.75e-8_log10-mod.csv"); # 1.75e-8 # 1
dts12_2_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR101.25e-7_log10-mod.csv"); # 1.25e-7 # 2
dts12_3_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR101.7675e-7_log10-mod.csv"); # 1.7675e-7 # 3 # maybe mistake
dts12_4_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR102.5e-7_log10-mod.csv"); # 2.5e-7 # 4
dts12_5_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR102.5e-6_log10-mod.csv"); # 2.5e-6 # 5
add_measurements!(p, dts12_0_csv)
add_measurements!(p, dts12_1_csv)
add_measurements!(p, dts12_2_csv)
add_measurements!(p, dts12_3_csv)
add_measurements!(p, dts12_4_csv)
add_measurements!(p, dts12_5_csv)

# chapter 2.3.13, page 48, figure S23
dts13_0_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR902.5e-9_log10-mod.csv"); # 0
dts13_1_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR902.5e-8_log10-mod.csv"); # 1
dts13_2_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR901.25e-7_log10-mod.csv"); # 2
dts13_3_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR902.5e-7_log10-mod.csv"); # 3
dts13_4_csv = read_measurements("./jak2stat5/Data/JAK2STAT5_CFUE_DR902.5e-6_log10-mod.csv"); # 4
add_measurements!(p, dts13_0_csv)
add_measurements!(p, dts13_1_csv)
add_measurements!(p, dts13_2_csv)
add_measurements!(p, dts13_3_csv)
add_measurements!(p, dts13_4_csv)

res = sim(p; alg = CVODE_BDF())
plot(res)
