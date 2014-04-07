---
layout: post
category : game
tagline: "and choose the best plan"
tags : [game]
---
~~~~~~
N = 20000

strat1 = NULL
for (i in 1:N)
{
	dice = sample(1:6,1)
	if (dice %in% c(5,6)){
		r1 = dice
		r2 = 0
		r3 = 0
	} else {
			r1 = 0
			dice = sample(1:6,1)
			if (dice %in% c(4,5,6)){
				r2 = dice
				r3 = 0
			} else {
				r2 = 0
				r3 = sample(1:6,1)
			}
	}
	strat1 = c(strat1, max(r1, r2, r3))
	i = i + 1
}
strat1.series = cumsum(strat1)/c(1:N)
#plot(strat1.series)

strat2 = NULL
for (i in 1:N)
{
	dice = sample(1:6,1)
	if (dice %in% c(5,6)){
		r1 = dice
		r2 = 0
		r3 = 0
	} else {
			r1 = 0
			dice = sample(1:6,1)
			if (dice %in% c(5,6)){
				r2 = dice
				r3 = 0
			} else {
				r2 = 0
				r3 = sample(1:6,1)
			}
	}
	strat2 = c(strat2, max(r1, r2, r3))
	i = i + 1
}
strat2.series = cumsum(strat2)/c(1:N)
#plot(strat2.series)

strat3 = NULL
for (i in 1:N)
{
	dice = sample(1:6,1)
	if (dice %in% c(4,5,6)){
		r1 = dice
		r2 = 0
		r3 = 0
	} else {
			r1 = 0
			dice = sample(1:6,1)
			if (dice %in% c(5,6)){
				r2 = dice
				r3 = 0
			} else {
				r2 = 0
				r3 = sample(1:6,1)
			}
	}
	strat3 = c(strat3, max(r1, r2, r3))
	i = i + 1
}
strat3.series = cumsum(strat3)/c(1:N)
#plot(strat3.series)

strat4 = NULL
for (i in 1:N)
{
	dice = sample(1:6,1)
	if (dice %in% c(4,5,6)){
		r1 = dice
		r2 = 0
		r3 = 0
	} else {
			r1 = 0
			dice = sample(1:6,1)
			if (dice %in% c(4,5,6)){
				r2 = dice
				r3 = 0
			} else {
				r2 = 0
				r3 = sample(1:6,1)
			}
	}
	strat4 = c(strat4, max(r1, r2, r3))
	i = i + 1
}
strat4.series = cumsum(strat4)/c(1:N)
#plot(strat4.series)

strat5 = NULL
for (i in 1:N)
{
	dice = sample(1:6,1)
	if (sample(0:1,1) == 1){
		r1 = dice
		r2 = 0
		r3 = 0
	} else {
			r1 = 0
			dice = sample(1:6,1)
			if (sample(0:1,1) == 1){
				r2 = dice
				r3 = 0
			} else {
				r2 = 0
				r3 = sample(1:6,1)
			}
	}
	strat5 = c(strat5, max(r1, r2, r3))
	i = i + 1
}
strat5.series = cumsum(strat5)/c(1:N)
#plot(strat5.series)

plot(1:N,strat1.series, type = "l",col="red", xlab = "Number of runs", ylab = "Average price")
lines(1:N, strat2.series, type = "l", col = "blue")
lines(1:N, strat3.series, type = "l", col = "green")
lines(1:N, strat4.series, type = "l", col = "yellow")
lines(1:N, strat5.series, type = "l", col = "black")
legend('topright', c("strat1.series","strat2.series","strat3.series","strat4.series", "random.series") , lty=1, col=c('red', 'blue', 'green',' yellow', 'black'), bty='n', cex=1)
~~~~~~
