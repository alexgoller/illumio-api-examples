#!/bin/sh

# can be used to create services for IP protocols not in the official UI interface (e.g. SCTP, 6in4, etc)

curl --data '{ "key": "app", "value": "Test 12345" }' \
     -X POST https://scp1.illum.io/api/v2/orgs/181/labels \
     -u $ILO_API_KEY:$ILO_API_TOKEN \
     -H 'Content-Type: application/json' \
     -H 'Accept: application/json'
