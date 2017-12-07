#!/bin/bash
#
# W. McGinty
# 28th Nov 2017
#
# Find the frequency of each institution - the bit after the '@' in the email
# address.
#
tempfile=$(mktemp --tmpdir)

sqlite3 -csv ~/Helpdesk/trac_latest.db > $tempfile <<EOF
-- Extract user id, email and user name
select s1.sid, (case when s1.name is 'name' then s1.value else 'None'end) as Name, (case when s1.name is 'email' then s1.value else 'None2' end) as Email
from session_attribute s1
where s1.name in ('email','name');
.exit
EOF

# tempfile has pairs of line like
#swr06mab,"Michael Ball",None2
#swr06mab,None,m.a.w.ball@reading.ac.uk

grep @ $tempfile | \
    #get the email
    awk -F, '{print $3}' | \
    #extract the institution
    awk -F'@' ' {print $2}' | \
    #sort by institution
    sort -k 1 | \
    # count each
    uniq -c | \
    # sort them in decreasing order of frequency
    sort -k 1 -n -r

rm $tempfile
