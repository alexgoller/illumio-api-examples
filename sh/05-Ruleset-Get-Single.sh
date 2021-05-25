#!/bin/sh

curl -H 'Accept: application/json' -X GET -u $ILO_API_KEY:$ILO_API_TOKEN "$ILO_SERVER/api/v2/orgs/$ILO_ORG/sec_policy/active/rule_sets/29" | jq .
