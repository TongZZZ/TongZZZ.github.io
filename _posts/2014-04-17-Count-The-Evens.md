---
layout: post
category : scala
tagline: "Scala option"
tags : [scala]
---

As a Statistics background, I know I keep coming back to R because I can do this
{% highlight bash %}
a = c(1,2,3,4,5,6,7,8,9,10)
sum(a[a%%2==0])
{% endhighlight %}
Until, I was once amazed by the simplicity of Lambda function in Scala and the List comprehension in Python: 

in Python
{% highlight python %}
a = [1,2,3,4,5,6,7,8,9,10]
sum(filter(lambda x: x % 2, a))
sum(x for x in a if x % 2)
{% endhighlight %}

in Scala
{% highlight scala %}
val a = List(1,2,3,4,5,6,7,8,9,10)
a.filter(_ % 2 == 0).sum
{% endhighlight %}

And, today I found another thing in Scala that is more convenient than in R.
With the help of "some" and "option" in Scala, it can automatically ignore the strings. So you can do 
{% highlight scala %}
val a = List("1","2","3","4","5","6","7","8","9","10","hello")
def f(x: String): Option[Int] = {
try {
    if (Integer.parseInt(x.trim) % 2 == 0) Some(Integer.parseInt(x.trim)) else None
  } catch {
    case e: NumberFormatException => None
  }
}
a.flatMap(f(_)).sum
{% endhighlight %}

compare to R
{% highlight bash %}
a = c("1","2","3","4","5","6","7","8","9","10","hello")
v = as.numeric(a[!is.na(as.numeric(a))])
sum(v[v%%2==0])
{% endhighlight %}
