$Devicename = hostname
$ErrorActionPreference = "SilentlyContinue"

$web = New-Object Net.WebClient
$username = "" 
$password = ""
$web.Credentials = new-object System.Net.NetworkCredential($username, $password)

#CloudBackup Checks
$CloudCheck = Get-EventLog -Logname "Application" -EntryType Information -source "Backup Manager" -message "*Failed*" -After (Get-Date).AddHours(-48)
if ($CloudCheck)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}

$CloudCheck = Get-EventLog -Logname "Application" -EntryType Information -source "Backup Manager" -message "*CompletedWithErrors*" -After (Get-Date).AddHours(-48)
if ($CloudCheck)
{

$web.DownloadString("http://domainhere/log/backups/$Devicename/Warning")
}

$CloudCheck = Get-EventLog -Logname "Application" -EntryType Information -source "Backup Manager" -message "*Errors count: 0*" -After (Get-Date).AddHours(-48)
if ($CloudCheck)
{

$web.DownloadString("http://domainhere/log/backups/$Devicename/Success")
}

##End of CloudBackup Checks

#	 Checks
$VeeamCheckJob = Get-EventLog -Logname "Veeam Backup" -EntryType "Error" -InstanceId 150 -Newest 1 -After (Get-Date).AddHours(-48)

if ($VeeamCheckJob)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}

$VeeamCheckJob = Get-EventLog -Logname "Veeam Backup" -EntryType "Warning" -InstanceId 150 -Newest 1 -After (Get-Date).AddHours(-48)

if ($VeeamCheckJob)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Warning")
}

$VeeamCheckJob = Get-EventLog -Logname "Veeam Backup" -EntryType "Information" -InstanceId 150 -Newest 1 -After (Get-Date).AddHours(-48)
if($VeeamCheckJob)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Success")
}

$VeeamCheckJob = Get-EventLog -Logname "Veeam Backup" -EntryType "Error" -InstanceId 194 -Newest 1 -After (Get-Date).AddHours(-48)
if($VeeamCheckJob)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}

$VeeamCheckJob = Get-EventLog -Logname "Veeam Backup" -EntryType "Error" -InstanceId 0 -Newest 1 -After (Get-Date).AddHours(-48)
if($VeeamCheckJob)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}

##
#End of Veeam Checks
##



#########################
# System Recovery Checks#
#########################

##Success
#6C8F1F7F: A scheduled independent recovery point of drive C:\ was created successfully.

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Information" -InstanceId 100  -message "*6C8F1F7F*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Success")
}

## Success
$sysrecov = Get-EventLog -LogName "Application" -EntryType "Information" -InstanceId 100  -message "* 6C8F1F89*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Success")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Information" -InstanceId 100  -message "*6C8F1F8A*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Success")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Information" -InstanceId 100  -message "*6C8F1F7B*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Success")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Information" -InstanceId 100  -message "*6C8F1F7C*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Success")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Information" -InstanceId 100  -message "*6C8F1F79*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Success")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Information" -InstanceId 100  -message "*6C8F1F7D*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Success")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Information" -InstanceId 100  -message "*6C8F1C55*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Success")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Information" -InstanceId 100  -message "*6C8F1F7A*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Success")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Information" -InstanceId 100  -message "*6C8F1C69*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Success")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Information" -InstanceId 100  -message "*6C8F1F80*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Success")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Information" -InstanceId 100  -message "*6C8F1F7E*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Success")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Information" -InstanceId 100  -message "*6C8F1C56*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Success")
}


## Info 6C8F17E7: An automatic recovery point was not created because an earlier recovery point from the same job was 
$sysrecov = Get-EventLog -LogName "Application" -EntryType "Information" -InstanceId 100  -message "*6C8F17E7*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Warning")
}

## Error EC8F17E5: Your recovery point location of \\NAS\backups\ is running out of space. Please run the Cleanup Recovery Points task to free up some space.
$sysrecov = Get-EventLog -LogName "Application" -EntryType "Information" -InstanceId 100  -message "*EC8F17E5*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Warning")
}
##Failures

## Error EBAB03F1: Operation aborted.
$sysrecov = Get-EventLog -LogName "Application" -EntryType "Error" -InstanceId 100  -message "*EBAB03F1*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}
## Error EC8F17B7: Cannot create recovery points for job: Drive Backup of OS (C:\)
$sysrecov = Get-EventLog -LogName "Application" -EntryType "Error" -InstanceId 100  -message "EC8F17B7" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}
## Error E7D1001F: Unable to write to file  &   Error EBAB03F1: The specified network name is no longer available.
$sysrecov = Get-EventLog -LogName "Application" -EntryType "Error" -InstanceId 100  -message "*E7D1001F*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}
## Error E7D10046: Unable to set file size.
$sysrecov = Get-EventLog -LogName "Error" -EntryType "Error" -InstanceId 100  -message "*E7D10046*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}


## Error E7D1003C: There is not enough space.
$sysrecov = Get-EventLog -LogName "Application" -EntryType "Error" -InstanceId 100  -message "*E7D1003C*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}

## Error EC8F03ED: Cannot create the recovery point.
$sysrecov = Get-EventLog -LogName "Application" -EntryType "Error" -InstanceId 100  -message "*EC8F03ED*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}

## Error E7D10026: Unable to get attributes for 'E:/'.
$sysrecov = Get-EventLog -LogName "Application" -EntryType "Error" -InstanceId 100  -message "*E7D10026*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}

## Error EBAB03F1: The system cannot find the path specified. 
$sysrecov = Get-EventLog -LogName "Application" -EntryType "Error" -InstanceId 100  -message "*EBAB03F1*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}

## Error EBAB03F1: The system cannot find the path specified. 
$sysrecov = Get-EventLog -LogName "Application" -EntryType "Error" -InstanceId 100  -message "*6C8F1C4F*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}


$sysrecov = Get-EventLog -LogName "Application" -EntryType "Error" -InstanceId 100  -message "*EBAB03F1*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Error" -InstanceId 100  -message "*EC8F17D8*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Error" -InstanceId 100  -message "*6C8F042C*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Error" -InstanceId 100  -message "*EC8F17B9*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Error" -InstanceId 100  -message "*E7D10041*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Error" -InstanceId 100  -message "*EC8F1796*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Error" -InstanceId 100  -message "*EC8F17D4*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Error" -InstanceId 100  -message "*EC8F042E*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Error" -InstanceId 100  -message "*6C8F1C2F*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}

$sysrecov = Get-EventLog -LogName "Application" -EntryType "Error" -InstanceId 100  -message "*E7640001*" -Newest 1 -After (Get-Date).AddHours(-48)
if ($sysrecov)
{
$web.DownloadString("http://domainhere/log/backups/$Devicename/Failure")
}

#############################
# End System Recovery Checks#
#############################

####################################
# Start Symantec Backup Exec Checks#
####################################


####################################
# End Symantec Backup Exec Checks  #
####################################
