echo 'Experiment 0 logistic Criteo'
time spark-submit --name 'Experiment 0 logistic Criteo Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_0_logistic_Criteo.rumble'
time spark-submit --name 'Experiment 0 logistic Criteo Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m logistic -p 0 -d Criteo
echo 'Experiment 0 RandomForest Criteo'
time spark-submit --name 'Experiment 0 RandomForest Criteo Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_0_RandomForest_Criteo.rumble'
time spark-submit --name 'Experiment 0 RandomForest Criteo Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m RandomForest -p 0 -d Criteo
echo 'Experiment 0 LinearSVC Criteo'
time spark-submit --name 'Experiment 0 LinearSVC Criteo Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_0_LinearSVC_Criteo.rumble'
time spark-submit --name 'Experiment 0 LinearSVC Criteo Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m LinearSVC -p 0 -d Criteo
echo 'Experiment 0 NB Criteo'
time spark-submit --name 'Experiment 0 NB Criteo Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_0_NB_Criteo.rumble'
time spark-submit --name 'Experiment 0 NB Criteo Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m NB -p 0 -d Criteo
echo 'Experiment 1 logistic Criteo'
time spark-submit --name 'Experiment 1 logistic Criteo Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_1_logistic_Criteo.rumble'
time spark-submit --name 'Experiment 1 logistic Criteo Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m logistic -p 1 -d Criteo
echo 'Experiment 1 RandomForest Criteo'
time spark-submit --name 'Experiment 1 RandomForest Criteo Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_1_RandomForest_Criteo.rumble'
time spark-submit --name 'Experiment 1 RandomForest Criteo Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m RandomForest -p 1 -d Criteo
echo 'Experiment 1 LinearSVC Criteo'
time spark-submit --name 'Experiment 1 LinearSVC Criteo Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_1_LinearSVC_Criteo.rumble'
time spark-submit --name 'Experiment 1 LinearSVC Criteo Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m LinearSVC -p 1 -d Criteo
echo 'Experiment 1 NB Criteo'
time spark-submit --name 'Experiment 1 NB Criteo Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_1_NB_Criteo.rumble'
time spark-submit --name 'Experiment 1 NB Criteo Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m NB -p 1 -d Criteo
echo 'Experiment 3 logistic Criteo'
time spark-submit --name 'Experiment 3 logistic Criteo Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_3_logistic_Criteo.rumble'
time spark-submit --name 'Experiment 3 logistic Criteo Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m logistic -p 3 -d Criteo
echo 'Experiment 3 RandomForest Criteo'
time spark-submit --name 'Experiment 3 RandomForest Criteo Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_3_RandomForest_Criteo.rumble'
time spark-submit --name 'Experiment 3 RandomForest Criteo Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m RandomForest -p 3 -d Criteo
echo 'Experiment 3 LinearSVC Criteo'
time spark-submit --name 'Experiment 3 LinearSVC Criteo Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_3_LinearSVC_Criteo.rumble'
time spark-submit --name 'Experiment 3 LinearSVC Criteo Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m LinearSVC -p 3 -d Criteo
echo 'Experiment 3 NB Criteo'
time spark-submit --name 'Experiment 3 NB Criteo Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_3_NB_Criteo.rumble'
time spark-submit --name 'Experiment 3 NB Criteo Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m NB -p 3 -d Criteo
echo 'Experiment 5 logistic Criteo'
time spark-submit --name 'Experiment 5 logistic Criteo Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_5_logistic_Criteo.rumble'
time spark-submit --name 'Experiment 5 logistic Criteo Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m logistic -p 5 -d Criteo
echo 'Experiment 5 RandomForest Criteo'
time spark-submit --name 'Experiment 5 RandomForest Criteo Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_5_RandomForest_Criteo.rumble'
time spark-submit --name 'Experiment 5 RandomForest Criteo Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m RandomForest -p 5 -d Criteo
echo 'Experiment 5 LinearSVC Criteo'
time spark-submit --name 'Experiment 5 LinearSVC Criteo Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_5_LinearSVC_Criteo.rumble'
time spark-submit --name 'Experiment 5 LinearSVC Criteo Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m LinearSVC -p 5 -d Criteo
echo 'Experiment 5 NB Criteo'
time spark-submit --name 'Experiment 5 NB Criteo Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_5_NB_Criteo.rumble'
time spark-submit --name 'Experiment 5 NB Criteo Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m NB -p 5 -d Criteo
echo 'Experiment 0 logistic YFCC'
time spark-submit --name 'Experiment 0 logistic YFCC Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_0_logistic_YFCC.rumble'
time spark-submit --name 'Experiment 0 logistic YFCC Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m logistic -p 0 -d YFCC
echo 'Experiment 0 RandomForest YFCC'
time spark-submit --name 'Experiment 0 RandomForest YFCC Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_0_RandomForest_YFCC.rumble'
time spark-submit --name 'Experiment 0 RandomForest YFCC Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m RandomForest -p 0 -d YFCC
echo 'Experiment 0 LinearSVC YFCC'
time spark-submit --name 'Experiment 0 LinearSVC YFCC Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_0_LinearSVC_YFCC.rumble'
time spark-submit --name 'Experiment 0 LinearSVC YFCC Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m LinearSVC -p 0 -d YFCC
echo 'Experiment 0 NB YFCC'
time spark-submit --name 'Experiment 0 NB YFCC Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_0_NB_YFCC.rumble'
time spark-submit --name 'Experiment 0 NB YFCC Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m NB -p 0 -d YFCC
echo 'Experiment 1 logistic YFCC'
time spark-submit --name 'Experiment 1 logistic YFCC Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_1_logistic_YFCC.rumble'
time spark-submit --name 'Experiment 1 logistic YFCC Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m logistic -p 1 -d YFCC
echo 'Experiment 1 RandomForest YFCC'
time spark-submit --name 'Experiment 1 RandomForest YFCC Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_1_RandomForest_YFCC.rumble'
time spark-submit --name 'Experiment 1 RandomForest YFCC Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m RandomForest -p 1 -d YFCC
echo 'Experiment 1 LinearSVC YFCC'
time spark-submit --name 'Experiment 1 LinearSVC YFCC Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_1_LinearSVC_YFCC.rumble'
time spark-submit --name 'Experiment 1 LinearSVC YFCC Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m LinearSVC -p 1 -d YFCC
echo 'Experiment 1 NB YFCC'
time spark-submit --name 'Experiment 1 NB YFCC Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_1_NB_YFCC.rumble'
time spark-submit --name 'Experiment 1 NB YFCC Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m NB -p 1 -d YFCC
echo 'Experiment 3 logistic YFCC'
time spark-submit --name 'Experiment 3 logistic YFCC Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_3_logistic_YFCC.rumble'
time spark-submit --name 'Experiment 3 logistic YFCC Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m logistic -p 3 -d YFCC
echo 'Experiment 3 RandomForest YFCC'
time spark-submit --name 'Experiment 3 RandomForest YFCC Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_3_RandomForest_YFCC.rumble'
time spark-submit --name 'Experiment 3 RandomForest YFCC Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m RandomForest -p 3 -d YFCC
echo 'Experiment 3 LinearSVC YFCC'
time spark-submit --name 'Experiment 3 LinearSVC YFCC Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_3_LinearSVC_YFCC.rumble'
time spark-submit --name 'Experiment 3 LinearSVC YFCC Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m LinearSVC -p 3 -d YFCC
echo 'Experiment 3 NB YFCC'
time spark-submit --name 'Experiment 3 NB YFCC Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_3_NB_YFCC.rumble'
time spark-submit --name 'Experiment 3 NB YFCC Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m NB -p 3 -d YFCC
echo 'Experiment 5 logistic YFCC'
time spark-submit --name 'Experiment 5 logistic YFCC Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_5_logistic_YFCC.rumble'
time spark-submit --name 'Experiment 5 logistic YFCC Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m logistic -p 5 -d YFCC
echo 'Experiment 5 RandomForest YFCC'
time spark-submit --name 'Experiment 5 RandomForest YFCC Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_5_RandomForest_YFCC.rumble'
time spark-submit --name 'Experiment 5 RandomForest YFCC Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m RandomForest -p 5 -d YFCC
echo 'Experiment 5 LinearSVC YFCC'
time spark-submit --name 'Experiment 5 LinearSVC YFCC Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_5_LinearSVC_YFCC.rumble'
time spark-submit --name 'Experiment 5 LinearSVC YFCC Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m LinearSVC -p 5 -d YFCC
echo 'Experiment 5 NB YFCC'
time spark-submit --name 'Experiment 5 NB YFCC Rumble' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --show-error-info yes --query-path 's3://rumbleml-data/rumble_experiments/query_5_NB_YFCC.rumble'
time spark-submit --name 'Experiment 5 NB YFCC Spark' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m NB -p 5 -d YFCC
