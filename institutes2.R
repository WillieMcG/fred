#
# R commands
# W. McGinty, 1st December, 2017
#
# Plot histograms of activity per institute
#
#
X11.options(type="Xlib") # fast plotting

# input is Ticket,Responses,Reporter,Institute
stats_in<-read.table("institutes2.csv",sep=",",header=TRUE)

N=length(stats_in$Institute)

title=paste(sprintf("Activity per institute 2017, %d tickets\n",N))

barplot(summary(stats_in$Institute),xlab="Institute",ylab="Frequency",main=title)
