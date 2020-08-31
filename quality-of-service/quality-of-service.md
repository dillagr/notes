## _General Notes_

Looks like GPO (Group Policy Objects) DSCP mark policies for Zoom does not work as intended.

So here a procure on how to do it for Zoom (Teams and Viber, included).

## _Setup and Confiuration_

Execute this on a privileged PowerShell terminal:

This will create the "JobTrigger" which runs "AtStartup", or when the computer boots.
'''$trigger = New-JobTrigger -AtStartup -RandomDelay 00:00:30'''o

Create the scheduled job:
'''Register-ScheduledJob -Trigger $trigger -FilePath C:\PATH\TO\DSCP.ps1 -Name QoS'''


## _Related Information_

[DSCP and Precedence Values, Cisco](https://www.cisco.com/c/en/us/td/docs/switches/datacenter/nexus1000/sw/4_0/qos/configuration/guide/nexus1000v_qos/qos_6dscp_val.pdf)
