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
