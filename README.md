## RumbleML experiments

Note: [overview of experiments](https://www.notion.so/ds3lab/RumbleML-8de8a950ddd840ec920dba193b11dc4d)

`/plots/runtime_plots.ipynb` generates all experimental plots for RumbleML runtime plots

`/plots/ablation_plots.ipynb` generates all experimental plots for RumbleML ablation study plots

`rumbleML_scripts_generator` generates shell scripts and rumble scripts for experiments

`run_all_experiments.sh` is the shell script for all experiments. 

In order to run the experiments within EMR, it might be required to move run_spark.py to the root.
We log experiments through `2>` and `1>` with

```
bash run_all_experiments 2> time_logs.txt 1> accuracy.txt 
```

