[![Heta project](https://img.shields.io/badge/%CD%B1-Heta_project-blue)](https://hetalang.github.io/)

# qsp benchmarks

Storing different cases for simulation using [HetaSimulator.jl](https://github.com/hetalang/HetaSimulator.jl)

Update heta compiler before run

```julia
heta_update()
```

## List of cases

- **/boehm** : reproduced model from "Boehm at al  J Proteome Res. 2014;13: 5685–5694. doi:10.1021/pr5006923", in LP article.
    conditions, experimental data, fitting, plot fitted

- **/jak2stat5** : reproduced "large" model with many datasets from ": Molecular Systems Biology 7:516", in draft LP article

- **/time-event** : testing TimeSwitcher multiple doses and injections

- old_fitting : two PK one compartment models : non-saturable and saturable (not finished yet)
