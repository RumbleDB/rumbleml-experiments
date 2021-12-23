from pyspark import SparkContext
from pyspark.sql import SparkSession
from pyspark.conf import SparkConf
from pyspark.ml import Pipeline
from pyspark.ml.feature import VectorAssembler 
from pyspark.ml.classification import LinearSVC
from pyspark.ml.linalg import Vectors

conf = SparkConf()
sc = SparkContext(conf=conf)
spark = SparkSession(sc)

def clean_data(path):
    f = sc.textFile(path)
    def create_tuple(x):
        label = x.split(' ')[0]
        if 'indoor' in label:
            label = 0
        else:
            if 'outdoor' in label:
                label = 1
        features = list(map(float, x.split(' ')[1:]))
        return (label, Vectors.dense(features))
    new_tuple = f.map(create_tuple)
    ds = f.map(create_tuple).collect()
    return spark.createDataFrame(ds, ["label", "features"])
    
training = clean_data('training.txt')
test = clean_data('test.txt')
vecAssembler = VectorAssembler(outputCol="transformed_features")
vecAssembler.setInputCols(["features"])
linearSVC = LinearSVC(featuresCol="transformed_features", maxIter=5)
pipeline = Pipeline(stages=[vecAssembler, linearSVC])
model = pipeline.fit(training)
prediction = model.transform(test)
predictionAndLabels = prediction.select("label", "prediction") 
correctY = predictionAndLabels.filter("label == prediction").count()
total = predictionAndLabels.count()
print(correctY / total)