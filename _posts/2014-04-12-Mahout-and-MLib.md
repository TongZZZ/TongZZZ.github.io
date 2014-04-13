---
layout: post
category : spark
tagline: "logistic regression test run"
tags : [ml]
---
I am getting myself used to two of the most grandeur machine learning library in the Hadoop ecosystem, [MLlib](http://spark.apache.org/mllib/) in Spark and [Mahout](https://mahout.apache.org/) in Hadoop. It would be interesting to test the accessibility and ability of the two packages. So I picked up a dataset from UCI ML database.

This is the [data set](http://archive.ics.uci.edu/ml/machine-learning-databases/ionosphere/) for classification analysis.

Benchmark is a simple R program:

{% highlight bash %}
iono = read.table("C:\\blog\\ion\\iono.txt")
vars = names(iono)
f <- as.formula(paste("V35 ~", paste(vars[1:(length(vars)-1)], collapse="+")))
mylogit <- glm(f, data = iono, family = "binomial")
summary(mylogit)
prob=predict(mylogit,type=c("response"))
cf = table(prob>0.5, iono$V35)
sum(cf[1,2],cf[2,1])/sum(cf)
[1] 0.06267806
{% endhighlight %}

Next, MLlib in Spark with scala:
{% highlight scala %}  
import org.apache.spark.mllib.classification.LogisticRegressionWithSGD
import org.apache.spark.mllib.regression.LabeledPoint

val data = sc.textFile("/home/cloudera/Downloads/iono.csv")

val trainingData = data.map { row =>
  val parts = row.split(',')
  val features = parts.slice(0,34).map(_.toDouble).toArray
  LabeledPoint(parts(34).toDouble, features)
}

trainingData.take(10).foreach(println)

val model = LogisticRegressionWithSGD.train(trainingData, 50000)

val labelAndPreds = trainingData.map { point =>
  val prediction = model.predict(point.features)
  (point.label, prediction)
}

val trainErr = labelAndPreds.filter(r => r._1 != r._2).count.toDouble / trainingData.count
println("Training Error = " + trainErr)
{% endhighlight %}

The result is:
{% highlight bash %}
Iteration  Error
2000       0.09971509971509972
10000      0.09401709401709402
50000      0.08262108262108261
{% endhighlight %}

Last one is Mahout in Hadoop with bash jobs:

I am currently learning Java but still not as intuitive as Scala code, so I result to the bash job without too much configuration: 
{% highlight bash %}
mahout org.apache.mahout.classifier.sgd.TrainLogistic --passes 200 --rate 100 --input /home/cloudera/Downloads/iono2.csv --features 100 --output /home/cloudera/Downloads/iono2.model --target target --categories 2 --predictors V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 V15 V16 V17 V18 V19 V20 V21 V22 V23 V24 V25 V26 V27 V28 V29 V30 V31 V32 V33 V34 --types n n

mahout org.apache.mahout.classifier.sgd.RunLogistic --input /home/cloudera/Downloads/iono2.csv --model /home/cloudera/Downloads/iono2.model --auc --confusion
{% endhighlight %}

And the error is:
{% highlight bash %}
Rate	 Error
100      0.1225071
50       0.1196581
10       0.1168091
7        0.0997151
5        0.1082621
{% endhighlight %}

Adding more "features" with "--fetures 500" doesn't help in this case, adding more "passes" doesn't help either.

I also tried the [org.apache.mahout.classifier.sgd.TrainAdaptiveLogistic](https://github.com/jackpay/mahout.sussex/blob/master/examples/src/main/java/org/apache/mahout/classifier/sgd/TrainAdaptiveLogistic.java) function, but could not get it right, the result is off.

All in all, this is just a simple comparison, I didn't spend much time tuning each model, and I just used the training data, without bothering doing the test, which could give different results. It is too early to say anything about this two projects([mahout](http://archive.apache.org/dist/mahout/) and [MLlib](https://issues.apache.org/jira/browse/SPARK/?selectedTab=com.atlassian.jira.jira-projects-plugin:summary-panel)) as they are still rapidly growing, I do feel I like to play with MLlib more because of Scala, and the ultimate dual would be in the big data arena.