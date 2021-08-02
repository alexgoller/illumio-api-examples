#!/bin/sh

# can be used to create services for IP protocols not in the official UI interface (e.g. SCTP, 6in4, etc)

curl -X POST $ILO_SERVER/api/v2/orgs/$ILO_ORG/traffic_flows/traffic_analysis_queries \
     -u $ILO_API_KEY:$ILO_API_TOKEN \
     -H 'Content-Type: application/json' \
     -H 'Accept: application/json' \
     -d @json

# extract custom fields out of this
#  jq '.[] | [.src.ip, .dst.ip, .dst.workload.hostname, .service.port, first(.dst.workload.labels[]? | select(.key == "app") .value) ]| @csv'
