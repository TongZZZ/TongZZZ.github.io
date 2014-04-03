---
layout: post
category : urn
tagline: "Group influence and information cascade"
tags : [urn]
---

We have two urns, ***A*** and ***B***, with Urn ***A*** containing 2 <font color='blue'>blue</font> balls and 1 <font color='red'>red</font> ball, and Urn ***B*** containing 1 <font color='blue'>blue</font> ball and 2 <font color='red'>red</font> balls. 

The following experiment is conducted to a group of people.

We randomly select a urn, and let participants guess which urn (***A*** or ***B***) it is without seeing inside the urn.

***Scenario I***:
One by one, each participant draw a ball from the urn, check the color without showing to other participants, guess which urn it is, and put the ball back to the urn.

***Scenario II***:
One by one, each participant draw a ball from the urn, check the color, but this time show it to other participants, guess which urn it is, and put the ball back to the urn.

So, the question to answer are:
 
***Which scenario leads to more accurate individual predictions?***

***Which scenario leads to more accurate combined predictions?***

<!--more-->

-------

It is meaningless if those participants make random decisions. So we assume them to make rational decisions and their decision follow the optimal __Bayes decision rule__:

Generally, let $\Omega=\{\omega_1, \omega_2\}$ be the set of the states, and $\overrightarrow{x}$ be the vector of the observations, then the Bayes' decision rule decides $\omega_1$ if $$
Prob(\omega_1|\overrightarrow{x})>Prob(\omega_2|\overrightarrow{x})
$$, and decides $\omega_2$ if 
$$
Prob(\omega_2|\overrightarrow{x})>Prob(\omega_1|\overrightarrow{x})
$$.

###Scenario I:

In the first scenario, the information of the decisions made from the predecessors of the current participant are withheld from the current participant.

**Individual Decision**:

The optimal decision process for each participant is the following: Each participant will decide the ball is from urn $$A$$, if she draws a black ball; and will decide the ball is from urn $$B$$, if she draws a white one. This is supported by the following proof of Bayes' Theorem and Bayes' decision rule:
The posterior probability of the ball is from urn $$A$$ after drawing a white ball is

$$
\begin{eqnarray*}
Prob(A|C_n=w)&=&\frac{Prob(C_n=w|A)Prob(A)}{Prob(C_n=w|A)Prob(A)+Prob(C_n=w|B)Prob(B)}\\
&=&\frac{\frac{1}{3}\times\frac{1}{2}}{\frac{1}{3}\times\frac{1}{2}+\frac{2}{3}\times\frac{1}{2}}\\
&=&\frac{1}{3}.
\end{eqnarray*}
$$

Similarly, we have

$$
\begin{eqnarray*}
Prob(A|C_n=b)&=&\frac{2}{3},\\
Prob(B|C_n=w)&=&\frac{2}{3},\\
Prob(B|C_n=b)&=&\frac{1}{3}.\\
\end{eqnarray*}
$$

Since

$$
\begin{eqnarray*}
Prob(A|C_n=b)>Prob(A|C_n=w),
\end{eqnarray*}
$$

and,

$$
\begin{eqnarray*}
Prob(B|C_n=w)>Prob(B|C_n=b),
\end{eqnarray*}
$$

based on the Bayes' decision rule, the above decisions stand.

**Combined decision**:

In this situation, from a combined point of view, the observations of the decisions of the participants are the same as the observations of the colors of the balls that the participants draw. Thus, conditioned on the type of urns, $D_n, n=1,2,3,\ldots,N$ follows IID Bernoulli distribution, and we have,

$$
\begin{eqnarray*}
Prob(D_n=A|A)&=&\frac{2}{3},\\
Prob(D_n=B|A)&=&\frac{1}{3};
\end{eqnarray*}
$$

and,

$$
\begin{eqnarray*}
Prob(D_n=A|B)&=&\frac{1}{3},\\
Prob(D_n=B|B)&=&\frac{2}{3}.
\end{eqnarray*}
$$

Let $n_A$ be the number of decisions from the participants that choose A,
then $n_A$ is a random variable, and it follows Binomial distribution conditioned on the type of urns:

$$
\begin{eqnarray*}
Prob(n_A=j|A)&=&\binom{N}{j}\Big(\frac{2}{3}\Big)^j\Big(\frac{1}{3}\Big)^{N-j},\\
Prob(n_A=j|B)&=&\binom{N}{j}\Big(\frac{1}{3}\Big)^j\Big(\frac{2}{3}\Big)^{N-j}.\\
\end{eqnarray*}
$$

From the Bayes' Theorem, we get the posterior Probabilities,

$$
\begin{eqnarray*}
Prob(A|n_A=j)&=&\frac{Prob(n_A=j|A)Prob(A)}{Prob(n_A=j|A)Prob(A)+Prob(n_A=j|B)Prob(B)}\\
&=&\frac{(\frac{2}{3})^j(\frac{1}{3})^{N-j}}{(\frac{2}{3})^j(\frac{1}{3})^{N-j}+(\frac{1}{3})^j(\frac{2}{3})^{N-j}},\\
Prob(B|n_A=j)&=&\frac{Prob(n_A=j|B)Prob(B)}{Prob(n_A=j|A)Prob(A)+Prob(n_A=j|B)Prob(B)}\\
&=&\frac{(\frac{1}{3})^j(\frac{2}{3})^{N-j}}{(\frac{2}{3})^j(\frac{1}{3})^{N-j}+(\frac{1}{3})^j(\frac{2}{3})^{N-j}}.
\end{eqnarray*}
$$

According to the Bayes' decision rule, if $$n_A>N-n_A$$ , or equivalently, $n_A>\frac{N}{2}$, we decide $A$, because $$
Prob(A | n_A=j)>Prob(B | n_A=j)
$$ , and vice versa for urn $B$. In conclusion, the combined decision rule is a simple counting heuristic, if more participants decide urn $A$ than urn $B$, we choose urn $A$ as the combined decision, and vice versa. If equal number of participants decide urn A and urn $B$, this is inconclusive and we can decide either of the two. 



###Scenario II:

Things begin to get tricky in this scenario, since each participant knows her predecessors' decisions. The first participant, her only information is her own draw. She will predict $A$ if she draws a black ball and will predict $B$ if she draws a white one. So her decision reflects her draw. If the second participant's draw match the color of the first person's decision, then the second participant should make the same decision as of the first participant. However, suppose the other way, the first participant draws a black and predict $A$ and the second participant draws a white. According to the Bayes' Theorem, because the urn sample is balanced, with equal probabilities $\frac{1}{2}$  of the priors of the type of the urn, the posterior probabilities are
$$Prob(A|C_1=b,C_2=w)=Prob(B|C_1=b,C_2=w)$$.

**Tie breaking**:

Based on the Bayes' decision rule, this is inconclusive, and we can choose from two schemes to break the tie, the first scheme is that the second participant will choose the type of urn that matches the color of her own draw; the second scheme is to make the decision randomly, that is the she decides either urn with probability $\frac{1}{2}$. Here, we will choose the first scheme, one of the reasons is that, in real life, the first person can make an error (draw a white and predicts $A$), and this scheme will cancel out the effect of the error. Essentially, the two scheme are the same, with only some numerical probability calculation differences.

**Cascade formation**:

Suppose the first two decisions are $A$, and the third participant observes a white ball, then this participant is deciding on an inferred observations of two black draws and her own white draw. Since $A$ and $B$ are equally likely a priori, and since the sample favors A, the posterior probability of A is strictly greater than $\frac{1}{2}$. Following the Bayes' decision rule, the third participant should decide urn A in spite of her own draw. Hence, the first two agreed decisions start a cascade in which the third and later participants will ignore their own draws and follow the agreed decision. It is worth mention that, the cascade can start at any position after the first two participants.

**Individual decision**:

Generally, let $n_A$ be the number of black balls that the $n$th participant infers from her predecessors; let $n_B=n-1-n_A$ be the number of white balls that the $n$th participant infers from  her predecessors. The posterior probabilities are

$$
\begin{eqnarray*}
Prob(A|D_1,D_2,D_3,\ldots,C_n)&=&Prob(A|n_A, n_B, C_n),\\
Prob(B|D_1,D_2,D_3,\ldots,C_n)&=&Prob(B|n_A, n_B, C_n).
\end{eqnarray*}
$$

The optimal decision process for each participant is the following:


- If $d=n_A-n_B\geq2$, no matter of which color the $n$th participant observe, she has 
$$
Prob(A|n_A, n_B, C_n)>Prob(B|n_A, n_B, C_n)
$$, so she should decide A.
- If $d=n_A-n_B=1$, if the $n$th participant draws a black, then 
$$
Prob(A|n_A, n_B, C_n=b)>Prob(B|n_A, n_B, C_n=b)
$$, she should decide A; if the $n$th participant draws a white, then 
$$
Prob(A|n_A, n_B, C_n=w)=Prob(B|n_A, n_B, C_n=w)
$$, she should decide B, based on the scheme we set up.
- If $d=n_A-n_B=0$, if the $n$th participant draws a black, then 
$$
Prob(A|n_A, n_B, C_n=b)>Prob(B|n_A, n_B, C_n=b)
$$, she should decide A; if the $n$th participant draws a white, then 
$$
Prob(A|n_A, n_B, C_n=w)<Prob(B|n_A, n_B, C_n=w)
$$, she should decide B.
- If $d=n_A-n_B=-1$, if the $n$th participant draws a white, then 
$$
Prob(A|n_A, n_B, C_n=w)<Prob(B|n_A, n_B, C_n=w)
$$, she should decide B; if the $n$th participant draws a black, then 
$$
Prob(A|n_A, n_B, C_n=b)=Prob(B|n_A, n_B, C_n=b)
$$, she should decide A, based on the scheme we set up.
- If $d=n_A-n_B\leq-2$, no matter of which color the $n$th participant observe, she has 
$$
Prob(A|n_A, n_B, C_n)<Prob(B|n_A, n_B, C_n)
$$, so she should decide B.

**Combined decision**:

Regardless of the sequence of decisions of selections, with the decision of all $N$ participants observed, the posterior probability of $A$ is

$$
\begin{eqnarray*}
&&Prob(A|D_1,D_2,D_3,\ldots,D_N)\\
&=&Prob(A|N_A,N_B)\\
&=&\frac{Prob(N_A,N_B|A)Prob(A)}{Prob(N_A,N_B|A)Prob(A)+Prob(N_A,N_B|B)Prob(B)}\\
&=&\frac{(\frac{2}{3})^{N_A}(\frac{1}{3})^{N_B}}{(\frac{2}{3})^{N_A}(\frac{1}{3})^{N_B}+(\frac{1}{3})^{N_A}(\frac{2}{3})^{N_B}}.
\end{eqnarray*}
$$

Similarly,

$$
Prob(B|D_1,D_2,D_3,\ldots,D_N)=\frac{(\frac{1}{3})^{N_A}(\frac{2}{3})^{N_B}}{(\frac{2}{3})^{N_A}(\frac{1}{3})^{N_B}+(\frac{1}{3})^{N_A}(\frac{2}{3})^{N_B}}.
$$

Just like Scenario I, the combined decision rule is again a simple counting heuristic, if more participants decide urn A than urn B, we choose urn A as the combined decision, and vice versa. If equal number of participants decide urn A and urn B, this is inconclusive and we can decide either of the two. 

###Comparison and simulations:

The following simulation has experiments with number of participants ranging from 1 to 100. For each experiment, we have 1000 repeated trials, and we take the average of the correct prediction rates of the 1000 trials, for both individuals and combined, as the prediction accuracy from scenario I and II. Since this model is balanced, with equal probability of choosing urn $A$ and urn $B$, and the probability of selecting a black ball from urn $A$ is the same as the probability of drawing a white ball from urn $B$. So, without loss of generality, we set the urn predetermined to be urn $A$. Then, any participant, no matter which color of ball she draws, who decides urn $A$ would be considered as making a correct prediction, on the other hand, who decides urn $B$ would be considered as making a wrong prediction.

Which is shown in the screenshot below:
![My helpful screenshot]({{ site.url }}/assets/images/Rplot01.png)



~~~~~~
#### Scenario I
Q=1
Chi=100 # Number of Participants
COMB1=NULL
INDI1=NULL
for(Q in 1:Chi)
{
ASUM1=0
BSUM1=0
AIND1=0
BIND1=0
p=1
P=1000  ### Number of Experiments
for (p in 1:P)
{

q=1
E=NULL
for (q in 1:Q)
{
if(runif(1)>=1/3)  ### Probability of random draws 
    {
     E=cbind(E,"A")
    }
   else
    {
     E=cbind(E,"B")
    }
q=q+1	
}
AIND1=AIND1+sum(E=="A")
BIND1=BIND1+sum(E=="B")
if(sum((E=="A")-(E=="B"))>0)
  {
   ASUM1=ASUM1+1
  }
  else if(sum((E=="A")-(E=="B"))<0)
  {
   BSUM1=BSUM1+1
  }
p=p+1
}
COMB1=cbind(COMB1,ASUM1/(ASUM1+BSUM1))
INDI1=cbind(INDI1,AIND1/(AIND1+BIND1))

Q=Q+1
}

COMB1  ### Combined prediction accuracy in Scenario I
INDI1  ### Individual prediction accuracy in Scenario I

#### Scenario II

N=1
Nu=100    ### Number of Participants 
COMB2=NULL
INDI2=NULL
for(N in 1:Nu)
{
ASUM2=0
BSUM2=0
AIND2=0
BIND2=0
m=1
M=1000    ### Number of Experiments
for(m in 1:M)
{
n=1
D=NULL
for (n in 1:N)
{
 SUM=sum((D=="A")-(D=="B"))
 
  if(SUM<=-2)
   { 
     D=cbind(D,"B")
   } 
 
  if(SUM==-1)
   { 
   if(runif(1)>=1/3)  ### Probability of random draws
    {
     D=cbind(D,"A")
    }
   else
    {
     D=cbind(D,"B")
    }
   }
 
  if(SUM==0)
   { 
   if(runif(1)>=1/3)
    {
     D=cbind(D,"A")
    }
   else
    {
     D=cbind(D,"B")
    }
   }
  
  if(SUM==1)
   { 
   if(runif(1)>=1/3)
    {
     D=cbind(D,"A")
    }
   else
    {
     D=cbind(D,"B")
    }
   }
   
  if(SUM>=2)
   {
    D=cbind(D,"A")
   }
  n=n+1 
 }
 AIND2=AIND2+sum(D=="A")
 BIND2=BIND2+sum(D=="B")
  if(sum((D=="A")-(D=="B"))>0)
  {
   ASUM2=ASUM2+1
  }
  else if(sum((D=="A")-(D=="B"))<0)
  {
   BSUM2=BSUM2+1
  }
m=m+1
}
COMB2=cbind(COMB2,ASUM2/(ASUM2+BSUM2))
INDI2=cbind(INDI2,AIND2/(AIND2+BIND2))

N=N+1
}

COMB2 ### Combined prediction accuracy in Scenario II
INDI2 ### Individual prediction accuracy in Scenario II

###Plots
plot(1:100,COMB1,xlab="# of Participants", ylab="Prediction accuracy", main="Individual-Group accuracy compromise",type="o", 

col="red",ylim=c(0.6,1))
lines(1:100,INDI1,type="o", col="yellow")
lines(1:100,COMB2,type="o", pch=22, lty=2, col="blue")
lines(1:100,INDI2,type="o", pch=22, lty=2, col="green")

legend(80,0.98, c("Combined I","Individual I","Combined II","Individual II"),lty=c(1,1,2,2),pch=c(21,21,22,22), lwd=c(1,1,1,1),col=c("red","yellow","blue","green"))
~~~~~~