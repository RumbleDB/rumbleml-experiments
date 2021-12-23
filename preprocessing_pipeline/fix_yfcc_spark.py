from pyspark import SparkContext
from pyspark.sql import SparkSession
from pyspark.conf import SparkConf
from pyspark.ml import Pipeline
from pyspark.ml.feature import VectorAssembler 
from pyspark.ml.classification import LinearSVC
import functools

conf = SparkConf()
sc = SparkContext(conf=conf)
spark = SparkSession(sc)

def clean_file(path):
    f = sc.textFile(path)
    def convert_line(x):
        label = x.split(' ')[0]
        if 'indoor' in label:
            label = 0
        else:
            if 'outdoor' in label:
                label = 1
        zipped_line = map(lambda x: f'{x[0]}:{x[1]}', zip(range(1,4097), x.split(' ')[1:]))
        res = str(label) + ' ' + functools.reduce(lambda a, b: a + ' ' + b, zipped_line)
        return res
    new_file = f.map(convert_line)
    new_file.saveAsTextFile(path + '.libsvm')

clean_file('training')
clean_file('test')

training = spark.read.format('libsvm').load("training.libsvm")
test = spark.read.format('libsvm').load("test.libsvm")

vecAssembler = VectorAssembler(outputCol="transformed_features")
vecAssembler.setInputCols(["features"])
linearSVC = LinearSVC(featuresCol="transformed_features", maxIter=5)
pipeline = Pipeline(stages=[vecAssembler, linearSVC])
model = pipeline.fit(training)
prediction = model.transform(test)
predictionAndLabels = prediction.select("label", "prediction") 
correctY = predictionAndLabels.filter("label == prediction").count()
total = predictionAndLabels.count()
correctY / total