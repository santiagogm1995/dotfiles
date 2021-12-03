#Login in account
Param (
    [string] $name = $null
)

$search = '.resources[] | select(.name==\"' + $name + '\") | .guid'

$guid = cf curl "/v3/apps" | jq -c $search

cf curl "/v3/apps/$guid/env" | jq .system_env_json

