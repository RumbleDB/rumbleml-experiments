from dspipes import MllibPipelines
from pyspark import SparkContext
from pyspark.sql import SparkSession
from pyspark.conf import SparkConf

import argparse

if __name__ == "__main__":

    parser = argparse.ArgumentParser(description="Run the RumbleML experiments.")

    DATASETS = ["Criteo", "YFCC"]
    parser.add_argument("-d", "--dataset", type=str, default="Criteo", choices=DATASETS,
        help="Datasets to use. Default: Criteo")

    MODELS = ['logistic', 'RandomForest', 'LinearSVC', 'NB']
    parser.add_argument("-m", "--model", type=str, default='logistic', choices=MODELS,
        help="Model to run. Default: logistic")
    ALL_PIPELINES = [0, 1, 3, 5]
    parser.add_argument("-p", "--pipeline", type=int, default=0, choices=ALL_PIPELINES,
        help="Pipelines to run. Default: 0")
    RUN = ['cluster', 'local']
    parser.add_argument("-r", "--run", type=str, default="cluster", choices=RUN,
        help="Setting to run. Default: cluster")

    args = parser.parse_args()
    pipeline_number = args.pipeline
    dataset = args.dataset
    modelname = args.model
    run_type = args.run

    #start = time.perf_counter()
    
    if run_type == 'cluster':
        conf=SparkConf()
        conf.set("spark.executor.memory", "19g")
        conf.set("spark.executor.instances", 4)
        conf.set("spark.executor.cores", 2)

        sc = SparkContext(conf=conf)
        spark = SparkSession(sc)
    else:
        sc = SparkContext("local", "SparkML script")
        spark = SparkSession(sc)

    pipeline = MllibPipelines.create_numerical_pipeline(f'pipe_{pipeline_number}', imputer=False, clf_mode=f'{modelname}')

    if dataset == 'Criteo':
        if run_type == 'cluster':
            training_path = "s3://rumbleml-data/output/output.parquet/"
            test_path = "s3://rumbleml-data/criteo.kaggle2014.test.parquet"
        else:
            training_path = "/Users/david/Projects/rumble_testbed/criteo.kaggle2014.test.parquet"
            test_path = "/Users/david/Projects/rumble_testbed/criteo.kaggle2014.test.parquet"
    elif dataset == 'YFCC':
        training_path = 's3://rumbleml-data/YFCC100M_train.parquet/'
        test_path = 's3://rumbleml-data/YFCC100M_test.parquet/'

    training = spark.read.load(training_path)
    test = spark.read.load(test_path)

    model = pipeline.fit(training)
    prediction = model.transform(test)
    predictionAndLabels = prediction.select("label", "prediction") 
    correctY = predictionAndLabels.filter("label == prediction").count()
    total = predictionAndLabels.count()
    print(f'{dataset} {modelname} {pipeline_number} {correctY / total}')