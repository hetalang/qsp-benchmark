using HetaSimulator, Plots

p = load_platform("./sbml_00375"; source = "index.heta", type = "heta");
m = p.models[:nameless]

res0 = sim(m; saveat = 0:0.06:3.0, observables = [:S1, :S2, :S3])
plot(res0)
DataFrame(res0)
