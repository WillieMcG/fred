#
# R commands
# W. McGinty,14th Sep 2017
#
# Plot histograms of the first response time
#
#
X11.options(type="Xlib") # fast plotting

# input is ticket, response_time_hrs
stats_in<-read.table("helpdesk_1st_response_time_2017.csv",sep=",",header=TRUE)

N=length(stats_in$ticket)

cat("Number of tickets   =" ,N,"\n")

maxtime=0.5*365.25 # 0.5 yrs in days
maxtime=1000/24.0
title=paste(sprintf("Histogram of ticket reponse time, %d tickets\n",N))
stats_in$response_time_hrs[stats_in$response_time_hrs/24.0>maxtime]=maxtime
jpeg(filename="response_time_hist.jpeg")
fred=hist(stats_in$response_time_hrs/24.0, main=title,xlab="Days")
dev.off()

M=length(stats_in$response_time_hrs)

h=ecdf(stats_in$response_time_hrs/24.0)
jpeg(filename="response_time.jpeg")
plot(h,xlab="response time days",ylab="Frac < response",main="Cumulative")
dev.off()

#lot log frequencies
fred$counts[fred$counts<=0]=1 # prevent taking log of zero
fred$counts=log10(fred$counts)
jpeg(filename="response_time_log.jpeg")
plot(fred,main=title,xlab="response time days", ylab="log10(Frequency)")
dev.off()