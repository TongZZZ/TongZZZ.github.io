---
layout: post
category : game
tagline: "and choose the best plan"
tags : [game]
---

You are offered to throw a die up to three times. And you will earn the face value of the die have you chosen to stop after each throw, or you go to the next round without any previous earnings. What is the optimal strategy and the expected payoff of this game?

<!--more-->
--------

###No plan:

If you don't have a plan, well, you are still earning some money. So you just randonly choose to stop for Round 1 or Round 2 or Round 3. And you are expected to earn
$$\frac{1}{2}(3.5)+\frac{1}{4}(3.5)+\frac{1}{4}(3.5) = 3.5$$


###The optimal plan:

Let's think backwards, in Round 3, you are expected to earn 3.5, so at Round 2, you would opt for 4, 5, or 6, and thus your expectation for Round 2 would be 
$$\frac{1}{6}(4)+\frac{1}{6}(5)+\frac{1}{6}(5)+\frac{1}{2}(3.5) = 4.25$$. So at Round 1, you would opt for 5, or 6. 

All in all, your epectation in total would be $$\frac{1}{6}(5)+\frac{1}{6}(6)+\frac{4}{6}\frac{1}{6}(4)+\frac{4}{6}\frac{1}{6}(5)+\frac{4}{6}\frac{1}{6}(6)+\frac{4}{6}\frac{1}{2}(3.5) = \overline{4.66}$$

###Mediocre plans:

You can choose to take only 5 or 6 in first two rounds (Strategy 2), 

or

4,5,6 in first round and 5,6 in second round (Strategy 3),

or 

4,5,6 in first two rounds (Strategy 4).

The earnings with these plans will actually turns out much better than no plan. We can calculate the expected earnings, but it would be better to visualize them.
The R code can be found at [this link](https://github.com/TongZZZ/TongZZZ.github.io/blob/master/assets/rcode/2014_04_07.r).

![My helpful screenshot]({{ site.url }}/assets/images/2014-04-07.png)

