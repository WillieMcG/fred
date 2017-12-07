#
# R commands
# W. McGinty,14th Sep 2017
#
# Plot histograms of the first response time
#
#
X11.options(type="Xlib") # fast plotting

# input is Ticket, response_time_hrs
stats_in<-read.table("helpdesk_1st_response_time_2017.csv",sep=",",header=TRUE)

N=length(stats_in$ticket)

maxtime=0.5*365.25*24 # 0.5 yrs in hours
maxtime=1000
title=paste(sprintf("Histogram of ticket reponse time, %d tickets\n",N))
stats_in$response_time_hrs[stats_in$response_time_hrs>maxtime]=maxtime
fred=hist(stats_in$response_time_hrs, main=title,xlab="Hours")

M=length(stats_in$response_time_hrs)

h=ecdf(stats_in$response_time_hrs)
plot(h,xlab="response time hrs",ylab="Frac < response",main="Cumulative")

#lot log frequencies
fred$counts[fred$counts<=0]=1 # prevent taking log of zero
fred$counts=log10(fred$counts)
plot(fred,main=title,xlab="hours", ylab="log10(Frequency)")

