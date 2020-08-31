## _General Notes_

Looks like GPO (Group Policy Objects) DSCP mark policies for Zoom does not work as intended.

So here's a procure on how to do it for Zoom (Teams and Viber, included).

## _Setup and Confiuration_

Execute this on a privileged PowerShell terminal:

This will create the "Trigger" which runs "AtStartup", or when the computer boots.

<code>$trigger = New-JobTrigger -AtStartup -RandomDelay 00:00:30</code>

Create the scheduled job:

<code>Register-ScheduledJob -Trigger $trigger -FilePath C:\PATH\TO\DSCP.ps1 -Name QoS</code>

Feel free to change "QoS" to a name that is easy to recall or meaningful.

## _Related Information_

* [DSCP and Precedence Values, Cisco](https://www.cisco.com/c/en/us/td/docs/switches/datacenter/nexus1000/sw/4_0/qos/configuration/guide/nexus1000v_qos/qos_6dscp_val.pdf)
* [Use PowerShell to Create Job that Runs at Startup](https://devblogs.microsoft.com/scripting/use-powershell-to-create-job-that-runs-at-startup)


## _Download_

The file is here: [DSCP.ps1](DSCP.ps1)
