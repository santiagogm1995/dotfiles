# btpguid - return BTP subaccount/directory GUIDs
Param
(
    [Parameter(Mandatory = $true)]
    [string] $name,
    [String]$target
)

try {
    $result = btp --format json get accounts/global-account --show-hierarchy | ConvertFrom-Json
    if ($null -eq $result) {
        throw "Need login in BTP"
    }
}
catch {
    btp login
    $result = btp --format json get accounts/global-account --show-hierarchy | ConvertFrom-Json
}


foreach ($item in $result.children) {
    if ($item.displayName -eq $name) { 
        $guid = $item.guid
    }
}

if ($null -eq $guid) {
    
    Write-Host "Children not found, select a subaccount:" -ForegroundColor Yellow

    foreach ($item in $result.children) {
        Write-Host "--> " $item.displayName -ForegroundColor Yellow
    }
}
else {
    Write-Host $guid
}

