## Zoom.exe, DSCP46
New-NetQosPolicy -Name "Zoom" -AppPathNameMatchCondition "Zoom.exe" -NetworkProfile All -DSCPAction 46 -IPProtocolMatchCondition Both -PolicyStore ActiveStore

## Teams.exe, DSCP46
New-NetQosPolicy -Name "Teams" -AppPathNameMatchCondition "Teams.exe" -NetworkProfile All -DSCPAction 46 -IPProtocolMatchCondition Both -PolicyStore ActiveStore

## Viber.exe, DSCP18
New-NetQosPolicy -Name "Viber" -AppPathNameMatchCondition "Viber.exe" -NetworkProfile All -DSCPAction 18 -IPProtocolMatchCondition Both -PolicyStore ActiveStore

## REFERENCE: https://www.cisco.com/c/en/us/td/docs/switches/datacenter/nexus1000/sw/4_0/qos/configuration/guide/nexus1000v_qos/qos_6dscp_val.pdf


## Increase-Ports, improve network performance
netsh int ipv4 set dynamicport tcp start=1025 num=64511
netsh int ipv4 set dynamicport udp start=1025 num=64511

## REFERENCE: https://docs.microsoft.com/en-us/biztalk/technical-guides/settings-that-can-be-modified-to-improve-network-performance
