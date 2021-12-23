## RumbleML experiments

`/plots/runtime_plots.ipynb` generates all experimental plots for RumbleML runtime plots

`/plots/ablation_plots.ipynb` generates all experimental plots for RumbleML ablation study plots

`/preprocessing_pipeline` includes the end-to-end scripts for our pipelines in RumbleML and spark.ml to compare. `fix_yfcc.rumble` and `fix_yfcc_spark.py` are both preprocessing the raw YFCC data and training an ML model afterwards, while `fix_yfcc_store_libsvm_spark.py` additionally also stores the data as libsvm file.

`rumbleML_scripts_generator` generates shell scripts and rumble scripts for experiments

`run_all_experiments.sh` is the shell script for all experiments. 

In order to run the experiments within EMR, it might be required to move run_spark.py to the root.
We log experiments through `2>` and `1>` with

```
bash run_all_experiments 2> time_logs.txt 1> accuracy.txt 
```

