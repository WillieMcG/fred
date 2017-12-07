#
# R commands
# W. McGinty, 7th December, 2017
#
# Plot histograms of activity per institute
#
#
X11.options(type="Xlib") # fast plotting

# input is Institute,Tickets,Responses,Users Responses_per_tkt,
stats_in<-read.table("institutes.csv",sep=",",header=TRUE)

N=length(stats_in$Institute)

tkts_per_user = stats_in$Tickets/stats_in$Users

title=paste(sprintf("Tickets/Reporter by institute 2017, %d institutes\n",N))
barplot(tkts_per_user,names.arg=stats_in$Institute, xlab="Institute",ylab="Ticket/Reporter",main=title)

title=paste(sprintf("Reporters by institute 2017, %d institutes\n",N))
barplot(stats_in$Users,names.arg=stats_in$Institute, xlab="Institute",ylab="Reporters",main=title)

title=paste(sprintf("Responses/Ticket by institute 2017, %d institutes\n",N))
barplot(stats_in$Responses_per_tkt,names.arg=stats_in$Institute, xlab="Institute",ylab="Responses/ticket",main=title)
