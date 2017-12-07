#!/bin/bash
#
# W. McGinty
# 30th Nov 2017
#
# Find for each ticket the number of comments
#
#
tempfile=$(mktemp --tmpdir)

echo Tickets, Comments > max_comments_per_ticket2.csv

#
# oldvalue is overloaded. It is usually the comment number, butcan contain things like 'description.1'
# and, if inline comments are used, '8.9' i.e. mid way between two comments.
#
# In order for max to work we must convert the old values to integer - note that this will give an
# error if presented with a non-integer.
#
sqlite3 -csv ~/Helpdesk/trac_latest.db > $tempfile <<EOF
select ticket,max(cast(oldvalue as integer))
from ticket_change
where field="comment" and oldvalue not like 'descri%' and oldvalue not like '%.%'
group by ticket;
.exit
EOF

cat $tempfile >> max_comments_per_ticket2.csv

# Use R to get the plots - creates Rplots.pdf
Rscript proc_max_comments.R

rm max_comments_per_ticket2.csv

rm $tempfile
