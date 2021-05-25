# Create empty ruleset

* Apply to scope with shown array of labels

```ilo rule_set create --name "Example App Ruleset" --scopes '[[ { "label" : { "href":"/orgs/1/labels/15"}},{"label":{"href":"/orgs/1/labels/17"}}]]'
```
# Create ruleset with intrascope AMS (all workloads) rule and HTTPS ingress (check service, here the ingress service is 55)

* ingress_services holds the incoming services for that rule
* extra scope rules must have unscoped_consumers set to true

```
ilo rule_set create --name "Example Ruleset" \
        --scopes '[[ { "label" : { "href":"/orgs/1/labels/41"}}]]' \
        --rules '[ {"description":"","enabled":true,"providers":[{"actors":"ams"}],"consumers":[{"actors":"ams"}],"ingress_services":[{"href":"/orgs/1/sec_policy/draft/services/1"}], "resolve_labels_as":{"providers":["workloads"],"consumers":["workloads"]} }, { "enabled": true, "unscoped_consumers": true, "providers": [ { "label": { "href": "/orgs/1/labels/18" }} ], "consumers": [ { "actors": "ams" } ], "ingress_services": [ { "href": "/orgs/1/sec_policy/draft/services/55" } ], "resolve_labels_as": { "providers": [ "workloads" ], "consumers": [ "workloads" ] }}]'
```
