#
# R commands
# W. McGinty, 8th December, 2017
#
# Plot history of CMS responses
#
#
X11.options(type="Xlib") # fast plotting

# input is Year, Tickets, Reporters
stats_in<-read.table("years.csv",sep=",",header=TRUE)

N=length(stats_in$Year)

title=paste(sprintf(" CMS Help Tickets\n"))
barplot(stats_in$Tickets,names.arg=stats_in$Year, xlab="Year",ylab="Tickets",main=title)

title=paste(sprintf("CMS Help Reporters\n",N))
barplot(stats_in$Reporters,names.arg=stats_in$Year, xlab="Year",ylab="Reporters",main=title)


