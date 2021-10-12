Param (
    [string] $mtarPath = $null
)

cf deploy $mtarPath --abort-on-error