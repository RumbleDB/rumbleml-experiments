## RumbleML experiments

Note: [overview of experiments](https://www.notion.so/ds3lab/RumbleML-8de8a950ddd840ec920dba193b11dc4d)

`rumbleML_plots.ipynb` generates all experimental plots for RumbleML paper (WIP)

`rumbleML_scripts_generator` generates shell scripts and rumble scripts for experiments

`run_all_experiments.sh` is the shell script for all experiments. Note: Unfortunately some pipelines are restricted from running (see research log for explanation) which is why we keep a commented version of this script in [this gist](https://gist.github.com/daviddao/ad94d43c80f050a616487fd0eafb8a62)

In order to run the experiments within EMR, it might be required to move run_spark.py to the root.
We log experiments through `2>` and `1>` with

```
bash run_all_experiments 2> time_logs.txt 1> accuracy.txt 
```

### Research Log for RumbleML

#### 29.11 - LinearSVC actually provides maxIter argument (documentation missing in RumbleML)

#### 28.11 - Naive Bayes algorithm not available due to negative values in YFCC

Error stack:

```
Caused by: java.lang.IllegalArgumentException: requirement failed: Naive Bayes requires nonnegative feature values but found
```

#### 28.11 - Pipeline 3 and 5 are causing buffer overflow due to PCA for YFCC

Error stack:

```
We are very embarrassed, because an error has occured that we did not anticipate ?: Buffer overflow. Available: 7, required: 8
Serialization trace:
data$mcD$sp (breeze.linalg.DenseVector$mcD$sp)
We would like to investigate this and make sure to fix it. We would be very grateful if you could contact us or file an issue on GitHub with your query.
Link: github.com/RumbleDB/rumble/issues
For more debug info (e.g., so you can communicate it to us), please try again using --show-error-info yes in your command line.
com.esotericsoftware.kryo.KryoException: Buffer overflow. Available: 7, required: 8
Serialization trace:
data$mcD$sp (breeze.linalg.DenseVector$mcD$sp)
at com.esotericsoftware.kryo.io.Output.require(Output.java:167)
at com.esotericsoftware.kryo.io.Output.writeLong(Output.java:530)
at com.esotericsoftware.kryo.io.Output.writeDouble(Output.java:659)
at com.esotericsoftware.kryo.io.Output.writeDoubles(Output.java:740)
at com.esotericsoftware.kryo.serializers.DefaultArraySerializers$DoubleArraySerializer.write(DefaultArraySerializers.java:211)
at com.esotericsoftware.kryo.serializers.DefaultArraySerializers$DoubleArraySerializer.write(DefaultArraySerializers.java:200)
at com.esotericsoftware.kryo.Kryo.writeObjectOrNull(Kryo.java:629)
at com.esotericsoftware.kryo.serializers.ObjectField.write(ObjectField.java:86)
at com.esotericsoftware.kryo.serializers.FieldSerializer.write(FieldSerializer.java:508)
at com.esotericsoftware.kryo.Kryo.writeClassAndObject(Kryo.java:651)
at org.apache.spark.serializer.KryoSerializerInstance.serialize(KryoSerializer.scala:378)
at org.apache.spark.executor.Executor$TaskRunner.run(Executor.scala:542)
at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
at java.lang.Thread.run(Thread.java:748)
```

#### 28.11 - Pipeline 3 and 5 are not available for Criteo due to sparsity

Error stack:

```
py4j.protocol.Py4JJavaError: An error occurred while calling o63.fit.
: org.apache.spark.SparkException: Job aborted due to stage failure: Task 0 in stage 5.0 failed 4 times, most recent failure: Lost task 0.3 in stage 5.0 (TID 46) (ip-172-31-7-110.us-east-2.compute.internal executor 4): java.lang.IllegalArgumentException: axpy only supports adding to a dense vector but got type class org.apache.spark.mllib.linalg.SparseVector.
at org.apache.spark.mllib.linalg.BLAS$.axpy(BLAS.scala:68)
at org.apache.spark.mllib.feature.PCA.$anonfun$fit$3(PCA.scala:52)
at scala.collection.Iterator$$anon$10.next(Iterator.scala:459)
at scala.collection.Iterator$SliceIterator.next(Iterator.scala:271)
at scala.collection.Iterator.foreach(Iterator.scala:941)
at scala.collection.Iterator.foreach$(Iterator.scala:941)
at scala.collection.AbstractIterator.foreach(Iterator.scala:1429)
at scala.collection.generic.Growable.$plus$plus$eq(Growable.scala:62)
at scala.collection.generic.Growable.$plus$plus$eq$(Growable.scala:53)
at scala.collection.mutable.ArrayBuffer.$plus$plus$eq(ArrayBuffer.scala:105)
at scala.collection.mutable.ArrayBuffer.$plus$plus$eq(ArrayBuffer.scala:49)
at scala.collection.TraversableOnce.to(TraversableOnce.scala:315)
at scala.collection.TraversableOnce.to$(TraversableOnce.scala:313)
at scala.collection.AbstractIterator.to(Iterator.scala:1429)
at scala.collection.TraversableOnce.toBuffer(TraversableOnce.scala:307)
at scala.collection.TraversableOnce.toBuffer$(TraversableOnce.scala:307)
at scala.collection.AbstractIterator.toBuffer(Iterator.scala:1429)
at scala.collection.TraversableOnce.toArray(TraversableOnce.scala:294)
at scala.collection.TraversableOnce.toArray$(TraversableOnce.scala:288)
at scala.collection.AbstractIterator.toArray(Iterator.scala:1429)
at org.apache.spark.rdd.RDD.$anonfun$take$2(RDD.scala:1449)
at org.apache.spark.SparkContext.$anonfun$runJob$5(SparkContext.scala:2281)
at org.apache.spark.scheduler.ResultTask.runTask(ResultTask.scala:90)
at org.apache.spark.scheduler.Task.run(Task.scala:131)
at org.apache.spark.executor.Executor$TaskRunner.$anonfun$run$3(Executor.scala:497)
at org.apache.spark.util.Utils$.tryWithSafeFinally(Utils.scala:1439)
at org.apache.spark.executor.Executor$TaskRunner.run(Executor.scala:500)
at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
at java.lang.Thread.run(Thread.java:748)

Driver stacktrace:
at org.apache.spark.scheduler.DAGScheduler.failJobAndIndependentStages(DAGScheduler.scala:2470)
```
