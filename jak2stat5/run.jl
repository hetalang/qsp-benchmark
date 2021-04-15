using SimSolver, Plots, CSV

p = load_platform("./jak2stat5");

### Default run

simulate(p.models[:nameless], tspan = (0., 100.)) |> plot

### Load conditions

cond_csv = read_conditions_csv("./jak2stat5/Data/conditions.csv");
add_conditions!(p, cond_csv)

# chapter 2.3.1, page 21, figure S11 => task1
dts1_csv = read_measurements_csv("./jak2stat5/Data/JAK2STAT5_CFUE_Long_log10-mod.csv")
add_measurements!(p, dts1_csv)

# chapter 2.3.2, page 23, figure S12
dts2_csv = read_measurements_csv("./jak2stat5/Data/JAK2STAT5_CFUE_Concentrations_log10-mod.csv")
add_measurements!(p, dts2_csv)

simulate(p) |> plot

# chapter 2.3.3, page 23, figure S12
task3 = SimpleSTask(
    models.nameless;
    tspan = (0., 400.),
    constants = (ActD=0.0, CISoe=0.0, SOCS3oe=0.0, SHP1oe=0.0, epo_level=1.25e-7),
    subtasks = [
        SubTask(0:4:400, output_ids = [:SOCS3RNA_foldA]),
        SubTask(0:4:400, output_ids = [:SOCS3RNA_foldB]),
        SubTask(0:4:400, output_ids = [:SOCS3RNA_foldC]),
        SubTask(0:4:400, output_ids = [:CISRNA_foldA]),
        SubTask(0:4:400, output_ids = [:CISRNA_foldB]),
        SubTask(0:4:400, output_ids = [:CISRNA_foldC]),
    ]
);

task3 |> solve_task |> plot

dts3 = CSV.File(
    "$model_dir/Data/JAK2STAT5_CFUE_RNA_log10.csv";
    delim=",",
    typemap = Dict(Int64=>Float64),
    missingstring = "NaN"
) |> DataFrame;

task3_loss = update_task(
    task3;
    #=constants = (
        ActD=0.0, CISoe=0.0, SOCS3oe=0.0, SHP1oe=0.0, epo_level=1.25e-7,
        sd_RNA_fold = 0.103074376969697
    ),=#
    subtasks = [SubLoss_norm_unknown(
        dts3;
        outputs = (SOCS3RNA_foldA = "SOCS3RNA_foldA", SOCS3RNA_foldB = "SOCS3RNA_foldB", SOCS3RNA_foldC = "SOCS3RNA_foldC", CISRNA_foldA = "CISRNA_foldA", CISRNA_foldB = "CISRNA_foldB", CISRNA_foldC = "CISRNA_foldC"),
        sigma = (SOCS3RNA_foldA = "sd_RNA_fold", SOCS3RNA_foldB = "sd_RNA_fold", SOCS3RNA_foldC = "sd_RNA_fold", CISRNA_foldA = "sd_RNA_fold", CISRNA_foldB = "sd_RNA_fold", CISRNA_foldC = "sd_RNA_fold"),
        t = "time",
        scope = "evid"
    )],
    reduce = loss_only_sum
);

res3 = task3_loss |> solve_task; # must be loss=-58.03, currently ???

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

multi_task = MultiSTask(
    [task1_loss, task2_loss, task3_loss];
    reduce = loss_only_sum
);

multi_res = multi_task |> solve_task;
