#!/bin/sh

workloader wkld-export --out csv --managed-only --output-file temp.csv 
csvgrep -c policy_state -m 'enforced-high' temp.csv | csvcut -c hostname,name,app,role,interfaces
rm temp.csv
