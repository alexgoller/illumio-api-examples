#!/bin/sh

curl -H 'Accept: application/json' -H 'Content-Type: application/json' -X POST -u $ILO_API_KEY:$ILO_API_TOKEN "$ILO_SERVER/api/v2/orgs/$ILO_ORG/sec_policy/draft/rule_sets/29/sec_rules" -d '{ "enabled": true, "description": "Added rule", "providers": [{ "label": { "href": "/orgs/1/labels/18"}}], "consumers": [{ "label": { "href": "/orgs/1/labels/17"}}], "ingress_services": [{ "href": "/orgs/1/sec_policy/active/services/13" }], "resolve_labels_as": { "providers": [ "workloads" ], "consumers": [ "workloads" ]} '
