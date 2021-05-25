#!/bin/sh

curl -H 'Accept: application/json' -H 'Content-Type: application/json' -X PUT -u $ILO_API_KEY:$ILO_API_TOKEN "$ILO_SERVER/api/v2/orgs/$ILO_ORG/sec_policy/draft/rule_sets/29" -d '{"enabled": false,"name":"SCOM | Production (disabled)"}'
