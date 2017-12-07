#
# R commands
# W. McGinty,11th Sep 2017
#
# Plot histograms of the reponses per ticket.
#
#
X11.options(type="Xlib") # fast plotting

# input is Ticket, Comments
stats_in<-read.table("max_comments_per_ticket2.csv",sep=",",header=TRUE)

N=length(stats_in$Tickets)

title=paste(sprintf("Histogram of reponses per ticket, %d tickets\n",N))
fred=hist(stats_in$Comments, main=title,xlab="responses")

#Plot log frequencies
fred$counts=log10(fred$counts)
plot(fred,main=title,xlab="responses", ylab="log10(Frequency)")