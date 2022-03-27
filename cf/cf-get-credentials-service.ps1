
cf s

$service = Read-Host "Select the service: "

cf service-key $service default | tail -n +2  |jq -c '. | .clientid,.clientsecret' 