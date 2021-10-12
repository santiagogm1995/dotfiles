#Login in account
Param (
    [string] $path = $null
)

if ($path -eq [String]::Empty) {
    Write-Error -Message "Path to file not found. Try with 'check-services <path-to-file>'"
    exit
}

$yaml = (Get-Content -Path $path | ConvertFrom-Yaml)
$array = @()
[System.Collections.ArrayList]$serviceExist = $array

$cmd = cf s

for ($i = 3; $i -lt $cmd.Length ; $i++) {

    $temp = $cmd[$i].split(' ')[0]

    $trash = $serviceExist.Add($temp)

}

foreach ($service in $yaml.resources) {
    $serviceName = $service.name
    $serviceType = $service.type

    if ($serviceType -eq 'org.cloudfoundry.existing-service' -and !$serviceExist.Contains($serviceName)) {
        Write-Error -Message ( -join ('No esta --> ', $serviceName))
    }
}