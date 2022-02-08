# Get logs from an app
cf a

$application = Read-Host "Select the application: "

cf logs $application --recent