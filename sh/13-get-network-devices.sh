#!/bin/sh

# can be used to create services for IP protocols not in the official UI interface (e.g. SCTP, 6in4, etc)

curl -X GET $ILO_SERVER/api/v2/orgs/$ILO_ORG/workloads \
     -u $ILO_API_KEY:$ILO_API_TOKEN \
     -H 'Content-Type: application/json' \
     -H 'Accept: application/json'
    
# | \
#    jq '.[]| { hostname: .hostname, interfaces: .interfaces[].address, enforcement: .enforcement_mode} | select(.enforcement == "full")| [.hostname,.interfaces,.enforcement]| @csv'
