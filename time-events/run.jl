using HetaSimulator, Plots

p = load_platform("./time-events"; rm_out = true);
model = models(p)[:nameless]

# for s1 : dose

res = sim(model; tspan = (0, 1200), observables = [:s1])
plot(res)

res = sim(model; tspan = (0,1200), observables = [:comp1, :s1], events_on = [:dose_sw1=>false])
plot(res)

# for s2 : injection

res = sim(model;
    tspan = (0, 69600),
    saveat = collect(48000.:720.:69600.),
    observables = [:s2],
    events_on = [:dose_sw1=>false]
    )
plot(res)

res = sim(model;
    tspan = (0, 69_600),
    saveat = collect(48000.:720.:69600.),
    observables = [:comp2, :s2],
    events_on = [:infusion_on2=>false, :infusion_off2=>false]
)
plot(res)
