## Zoom.exe, DSCP46
New-NetQosPolicy -Name "Zoom" -AppPathNameMatchCondition "Zoom.exe" -NetworkProfile All -DSCPAction 46 -IPProtocolMatchCondition Both -PolicyStore ActiveStore

## Teams.exe, DSCP46
New-NetQosPolicy -Name "Teams" -AppPathNameMatchCondition "Teams.exe" -NetworkProfile All -DSCPAction 46 -IPProtocolMatchCondition Both -PolicyStore ActiveStore

## Viber.exe, DSCP18
New-NetQosPolicy -Name "Viber" -AppPathNameMatchCondition "Viber.exe" -NetworkProfile All -DSCPAction 18 -IPProtocolMatchCondition Both -PolicyStore ActiveStore

## REFERENCE: https://www.cisco.com/c/en/us/td/docs/switches/datacenter/nexus1000/sw/4_0/qos/configuration/guide/nexus1000v_qos/qos_6dscp_val.pdf
