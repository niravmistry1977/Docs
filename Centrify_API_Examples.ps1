#NAME:Add-CdmApplicationRight
#SYNOPSIS:Adds a Windows application right to a specified role.
# --------------------------  Add an application right to a role  --------------------------
#This example adds the application right named “winapp1” to the role definition named “firewall" which is defined in the "global” zone.
$role = Get-CdmRole –Zone "cn=global,cn=Zones,dc=ajax,dc=com" –Name "firewall"
Get-CdmApplicationRight –Zone "cn=global,cn=Zones,dc=ajax,dc=com" –Name "winapp1" | Add-CdmApplicationRight –Role $firewall
#----------------------------------------------------------------------------------------
#NAME:Add-CdmCommandRight
#SYNOPSIS:Adds a UNIX command right to a specified role.
# --------------------------  Add a command right to a role.  --------------------------
#Gets role1 in zone1, gets command right cmd1 in zone1, and adds the command right to the role.
$role = Get-CdmRole –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "role1"
Get-CdmCommandRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "cmd1" | Add-CdmCommandRight –Role $role
#----------------------------------------------------------------------------------------
#NAME:Add-CdmDesktopRight
#SYNOPSIS:Adds a Windows desktop right to a specified role.
# --------------------------  Add a Windows desktop right to a role.  --------------------------
#Gets role1 in zone1, gets Windows desktop right "dt1" in zone1, and adds the right to the role.
$role = Get-CdmRole –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "role1"
$right = Get-CdmDesktopRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "dt1"
Add-CdmDesktopRight –Right $right –Role $role1
#----------------------------------------------------------------------------------------
#NAME:Add-CdmNetworkAccessRight
#SYNOPSIS:Adds a Windows network access right to a specified role.
# --------------------------  Add a network access right to a role.  --------------------------
#Gets role1 in zone1, gets Windows network access right "net1" in zone1, and adds the right to the role.
$role = Get-CdmRole –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "role1"
$right = Get-CdmNetworkAccessRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "net1"
Add-CdmNetworkAccessRight –Right $right –Role $role1
#----------------------------------------------------------------------------------------
#NAME:Add-CdmPamRight
#SYNOPSIS:Adds a PAM application access right to a role.
# --------------------------  Add a PAM acces right to a role.  --------------------------
#Gets role1 from zone1, gets PAM access right "ssh" from zone1, and adds the PAM access right to the role.
$role = Get-CdmRole –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "role1"
Get-CdmPamRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "ssh" | Add-CdmPamRight –Role $role
#----------------------------------------------------------------------------------------
#NAME:Add-CdmSshRight
#SYNOPSIS:Adds an SSH application right to a role.
# --------------------------  Add an SSH right to a role.  --------------------------
#Gets role1 in zone1, gets SSH right "dzssh-all" in zone1, and adds the right to the role.
$role = Get-CdmRole –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "role1"
Get-CdmSshRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "dzssh-all" | Add-CdmSshRight –Role $role
#----------------------------------------------------------------------------------------
#NAME:Export-CdmData
#SYNOPSIS:Exports roles and rights from the specified zone.
# --------------------------  Export roles and rights from a zone  --------------------------
#This example exports all of the roles and rights from the “global” zone to the "C:\demo.xml" file location.
Export-CdmData –Zone “cn=global,cn=Zones,dc=acme,dc=com” –FilePath “c:\demo.xml”
# --------------------------  Export specified rights  --------------------------
#This examples all of the Windows right definitions and no UNIX right definitions from the "global" zone to the "C:\demo.xml" file location.
Export-CdmData –Zone “cn=global,cn=Zones,dc=acme,dc=com” –FilePath “c:\demo.xml” -Desktop "*" -Application "*" -NetworkAccess "*"
#----------------------------------------------------------------------------------------
#NAME:Get-CdmApplicationRight
#SYNOPSIS:Gets an application right from a specified zone or role.
# --------------------------  Get all application rights for a role  --------------------------
#This example gets all of the application rights that have been added to role definition “HR-role" in the "Finance” zone.
$role = Get-CdmRole –Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "HR-role"
Get-CdmApplicationRight –Role $role
# --------------------------  Get a specific application right from a zone  --------------------------
#This example gets the application right named “winapp1” from the "Finance" zone.
Get-CdmApplicationRight –Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "winapp1"
#----------------------------------------------------------------------------------------
#NAME:Get-CdmCommandRight
#SYNOPSIS:Gets a command right from a zone or role.
# --------------------------  Get the command rights added to a role.  --------------------------
$role = Get-CdmRole –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "role1"
Get-CdmCommandRight –Role $role
Gets role1 in zone1 and gets all the command rights added to that role.
# --------------------------  Get a command right from a zone.  --------------------------
#Gets the command right for cmd1 in zone1.
Get-CdmCommandRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "cmd1"
#----------------------------------------------------------------------------------------
#NAME:Get-CdmComputerRole
#SYNOPSIS:Gets a computer role from a zone.
# --------------------------  Get a computer role.  --------------------------
#Gets the computer role named "cr1" in zone "zone1".
Get-CdmComputerRole -Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "cr1"
#----------------------------------------------------------------------------------------
#NAME:Get-CdmComputerRoleMember
#SYNOPSIS:Gets the members of a computer role.
# --------------------------  Get computer role members.  --------------------------
#Gets the members of the computer role defined in $CompRole.
Get-CdmComputerRoleMember -$CompRole
#----------------------------------------------------------------------------------------
#NAME:Get-CdmCredential
#SYNOPSIS:Gets user credentials.
# --------------------------  Get credentials.  --------------------------
#This example gets all of the user credentials currently in the cache.
Get-CdmCredential
#----------------------------------------------------------------------------------------
#NAME:Get-CdmDelegation
#SYNOPSIS:Gets the delegated administrative tasks for a zone, computer, or computer role.
# --------------------------  Get the users who have been delegated administrative tasks for the "Finance" zone  # --------------------------
#This example gets trustee information for the users who have been delegated administration tasks in the "Finance" zone. For example, 
#if "frank" and "eric" have been assigned administrative tasks, the command might return output similar to the following:
#Trustee		Tasks			Source
#frank@acme.com	JoinComputers		frank@acme.com
#eric@acme.com		ModifyZone		eric@acme.com
$zone = Get-CdmZone -Dn "cn=Finance,cn=Zones,dc=acme,dc=com"
Get-CdmDelegation –Zone $zone
# --------------------------  Get the users who have been delegated administrative tasks for the "engsrv" computer  # --------------------------
#This example gets trustee information for the users who have been delegated administrative tasks for the "engsrv" computer. For 
#example, if "frank" and "eric" have been assigned administrative tasks, the command might return output similar to the following:
#Trustee		Tasks		Source
#frank@acme.com	AddUsers	frank@acme.com
#eric@acme.com		AddGroups	eric@acme.com
$comp = Get-CdmManagedComputer -Computer "cn=engsrv,cn=Computers,dc=acme,dc=com"
Get-CdmDelegation –Computer $comp
# --------------------------  Get the users who have been delegated the “AddUsers” and “AddGroups” tasks in the "Finance" zone  # --------------------------
#This example gets trustee information for the users who have been delegated the "AddUsers" and "AddGroups" administration tasks in the 
#"Finance" zone. For example, if "anne" and "ben" have been assigned these administrative tasks, the command might return output 
#similar to the following:
#Trustee		Tasks		Source
#ann@acme.com		AddUsers	ann@acme.com
#ann@acme.com		AddGroups	ann@acme.com
#ben@acme.com		AddGroups	ben@acme.com
$zone = Get-CdmZone -Dn "cn=Finnce,cn=Zones,dc=acme,dc=com"
Get-CdmDelegation –Zone $zone –Task "AddUsers","AddGroups"
#----------------------------------------------------------------------------------------
#NAME:Get-CdmDesktopRight
#SYNOPSIS:Gets a Windows desktop right from a zone or role.
# --------------------------  Get all Windows desktop rights added to a role.  --------------------------
#Gets role1 in zone1, then gets all the Windows desktop rights added to that role.
$role = Get-CdmRole –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "role1"
Get-CdmDesktopRight –Role $role
# --------------------------  Get a specific Windows desktop right.  --------------------------
#Gets Windows desktop right "desktop1" in zone1.
Get-CdmDesktopRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "desktop1"
#----------------------------------------------------------------------------------------
#NAME:Get-CdmEffectiveDelegation
#SYNOPSIS:Gets the effective delegated administrative tasks for one or more users in a zone, on a computer, or in a computer role.
# --------------------------  Get the delegated administrative tasks assigned to the specified users in the "Finance" zone  # --------------------------
#This example gets the delegated administration tasks that have been assigned to the users "frank" and "eric" in the "Finance" zone. 
#For example, if "frank" and "eric" have been assigned administrative tasks, the command might return output similar to the following:
#Trustee		Tasks			Source
#frank@acme.com	JoinComputers		{sfadmin@acme.com}
#eric@acme.com		ModifyZone		{naadmin@acme.com}
$zone = Get-CdmZone -Dn "cn=Finance,cn=Zones,dc=acme,dc=com"
Get-CdmEffectiveDelegation –Zone $zone –User frank@acme.com,eric@acme.com
#----------------------------------------------------------------------------------------
#NAME:Get-CdmEffectiveGroupProfile
#SYNOPSIS:Gets effective group profiles for a specified zone or computer.
# --------------------------  Get all effective group profiles in zone  --------------------------
#This example gets all effective UNIX group profiles for the "Finance" zone.
Get-CdmEffectiveGroupProfile -Zone "cn=Finance,cn=Zones,dc=acme,dc=com"
#----------------------------------------------------------------------------------------
#NAME:Get-CdmEffectiveUnixRight
#SYNOPSIS:Gets the effective UNIX rights assigned.
# --------------------------  Get all effective UNIX rights in zone  --------------------------
#This example gets all effective UNIX rights for the "zone1" zone.
Get-CdmEffectiveUnixRight -Zone "cn=zone1,cn=Zones,dc=domain,dc=com"
# --------------------------  Get all effective UNIX rights for AD user  --------------------------
#This example gets all effective UNIX rights for the "user1" user.
Get-CdmEffectiveUnixRight -User "cn=user1,cn=Users,dc=domain,dc=com"
#----------------------------------------------------------------------------------------
#NAME:Get-CdmEffectiveUserProfile
#SYNOPSIS:Gets effective user profiles for a specified zone or computer.
# --------------------------  Get all effective user profiles in zone  --------------------------
Get-CdmEffectiveUserProfile -Zone "cn=Finance,cn=Zones,dc=acme,dc=com"
This example gets all effective user profiles in the "Finance" zone.
#----------------------------------------------------------------------------------------
#NAME:Get-CdmEffectiveWindowsRight
#SYNOPSIS:Gets the effective Windows rights assigned.
# --------------------------  Get all effective Windows rights in zone  --------------------------
#This example gets all effective Windows rights for the "zone1" zone.
Get-CdmEffectiveWindowsRight -Zone "cn=zone1,cn=Zones,dc=domain,dc=com"
# --------------------------  Get all effective Windows rights for AD user  --------------------------
#This example gets all effective Windows rights for the "user1" user.
Get-CdmEffectiveWindowsRight -User "cn=user1,cn=Users,dc=domain,dc=com"
#----------------------------------------------------------------------------------------
#NAME:Get-CdmGroupMember
#SYNOPSIS:Gets the members of a group that you specify.
# --------------------------  Get group members.  --------------------------
#Gets the members of the "GroupName" group.
Get-CdmGroupMember Group
#NAME:
#----------------------------------------------------------------------------------------
#NAME:Get-CdmGroupProfile
#SYNOPSIS:Gets UNIX group profiles for zone groups.
# --------------------------  Get all group profiles in a zone.  --------------------------
#Gets all the group profiles in zone "zone1".
Get-CdmGroupProfile -Zone "cn=zone1,cn=Zones,dc=domain,dc=com"
# --------------------------  Get all profiles for a specific group.  --------------------------
#Gets all group profiles for the AD group "group1", which has the UNIX name "mygroup".
Get-CdmGroupProfile -Group "cn=group1,cn=Users,dc=domain,dc=com" –Name "mygroup"
#----------------------------------------------------------------------------------------
#NAME:Get-CdmLocalGroupProfile
#SYNOPSIS:Gets UNIX group profiles for local groups.
# --------------------------  Get all local group profiles in zone.  --------------------------
#This example returns all of the local group profiles that are visible in the specified zone.
Get-CdmLocalGroupProfile -Zone "cn=finance,cn=Zones,dc=acme,dc=com"
# --------------------------  Get the local group profiles for a specific group.  --------------------------
#This example returns the local group profiles for the  "engr-sf" local group.
Get-CdmLocalGroupProfile -Name "engr-sf"
#----------------------------------------------------------------------------------------
#NAME:Get-CdmLocalUserProfile
#SYNOPSIS:Gets UNIX user profiles for local users.
# --------------------------  Get all local user profiles in zone.  --------------------------
#This example returns all of the local user profiles that are defined in the specified zone.
Get-CdmLocalUserProfile -Zone "cn=finance,cn=Zones,dc=acme,dc=com"
# --------------------------  Get the local user profile for a specific user.  --------------------------
#This example returns the local user profile for the local user "gunad03" from the /etc/passwd file.
Get-CdmLocalUserProfile -Name "gunad03"
#----------------------------------------------------------------------------------------
#NAME:Get-CdmManagedComputer
#SYNOPSIS:Gets zoned or auto-zoned managed computers.
# --------------------------  Get all computers joined to a specific zone.  --------------------------
Get-CdmManagedComputer -Zone "cn=zone1,cn=Zones,dc=domain,dc=com"
Gets all computers joined to zone “zone1”.
# --------------------------  Get the managed computer for a specific AD computer.  --------------------------
Get-CdmManagedComputer -Computer "cn=comp1,cn=Computers,dc=domain,dc=com"
Gets the managed computer for the Active Directory computer "comp1"
# --------------------------  Get all autozoned computers.  --------------------------
#Gets all auto-zoned computers, regardless of mode.
Get-CdmManagedComputer –AutoZone "both"
#----------------------------------------------------------------------------------------
#NAME:Get-CdmNetworkAccessRight
#SYNOPSIS:Gets a Windows network application right from a zone or role.
# --------------------------  Get all the Windows network access rights added to a role.  --------------------------
#Gets role1 in zone1 and gets all the Windows application rights that have been added to the role.
$role = Get-CdmRole –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "role1"
Get-CdmNetworkAccessRight –Role $role1
# --------------------------  Get a specific Windows network access right.  --------------------------
#Gets Windows network access right "net1" in zone1.
Get-CdmNetworkAccessRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "net1"
#----------------------------------------------------------------------------------------
#NAME:Get-CdmNisMap
#SYNOPSIS:Gets NIS maps for the specified zone.
# --------------------------  Get all NIS maps in a zone  --------------------------
#This example gets all NIS maps for the "Finance" zone.
Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com"
#----------------------------------------------------------------------------------------
#NAME:Get-CdmNisMapEntry
#SYNOPSIS:Gets NIS map entries for the specified NIS map.
# --------------------------  Get all NIS map entries in NIS map  --------------------------
#This example gets all of the NIS map entries in the "nismap1" NIS map.
Get-CdmNisMapEntry  -NisMap $nismap1
#----------------------------------------------------------------------------------------
#NAME:Get-CdmPamRight
#SYNOPSIS:Gets a PAM application access right from a zone or role.
# --------------------------  Get all the PAM access rights in a role.  --------------------------
#Gets role1 in zone1, then gets all the PAM access rights in that role.
$role = Get-CdmRole –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "role1"
Get-CdmPamRight –Role $role
# --------------------------  Get a specific PAM access right in a zone.  --------------------------
#Gets the PAM access right named "ssh" from zone zone1.
Get-CdmPamRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "ssh"
#----------------------------------------------------------------------------------------
#NAME:Get-CdmPersistedCredential
#SYNOPSIS:Gets encrypted credentials from the registry.
#----------------------------------------------------------------------------------------
#NAME:Get-CdmPreferredServer
#SYNOPSIS:Gets domain to server mapping.
# --------------------------  Get domain to server mapping.  --------------------------
Get-CdmPreferredServer
This example gets the list of domain controllers used to connect to specific Active Directory domains.
#----------------------------------------------------------------------------------------
#NAME:Get-CdmRole
#SYNOPSIS:Gets roles from a zone.
# --------------------------  Get all the roles in a zone.  --------------------------
#Gets all the roles in zone "zone1"
Get-CdmRole -Zone "cn=zone1,cn=Zones,dc=domain,dc=com"
#----------------------------------------------------------------------------------------
#NAME:Get-CdmRoleAssignment
#SYNOPSIS:Gets role assignments.
# --------------------------  Get all role assignments for a computer  --------------------------
#Specifies "role1" in "zone1" and gets all role assignments for that role in computer "comp1".
$role = Get-CdmRole –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "role1"
Get-CdmRoleAssignment -Computer "cn=comp1,cn=Computers,dc=domain,dc=com" –Role $role
#----------------------------------------------------------------------------------------
#NAME:Get-CdmSshRight
#SYNOPSIS:Gets an SSH application right from a zone or role.
# --------------------------  Get all SSH application rights added to a role.  --------------------------
$role = Get-CdmRole –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "role1"
Get-CdmSshRight –Role $role
Gets role1 in zone1 and gets all the SSH application rights that have been added to the role.
# --------------------------  Get a specific SSH application right from a zone.  --------------------------
Get-CdmSshRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "dzssh-all"
Gets SSH application right "dzssh-all" from zone1.
#----------------------------------------------------------------------------------------
#NAME:Get-CdmUserProfile
#SYNOPSIS:Gets user UNIX profiles.
# --------------------------  Get all the user profiles in a zone.  --------------------------
#Gets all the user profiles in zone "zone1".
Get-CdmUserProfile -Zone "cn=zone1,cn=Zones,dc=domain,dc=com"
# --------------------------  Get all user profiles for a specific user.  --------------------------
#Gets all the UNIX user profiles for the Active Directory user “user1” whose login name is "jon.doe"
Get-CdmUserProfile -User "cn=user1,cn=Users,dc=domain,dc=com" –Login "jon.doe"
#----------------------------------------------------------------------------------------
#NAME:Get-CdmZone
#SYNOPSIS:Gets the zone object.
# --------------------------  Get a specific zone  --------------------------
Get-CdmZone –Dn "cn=zone1,cn=Zones,dc=domain,dc=com"
Gets the zone at “cn=zone1,cn=Zones,dc=domain,dc=com”
# --------------------------  Get all zones with a specified type and name  --------------------------
Get-CdmZone -Name "engineering" –Type hierarchical
Gets all hierarchical zones named “engineering”
#----------------------------------------------------------------------------------------
#NAME:Get-CdmZpaSetting
#SYNOPSIS:Gets the Zone Provisioning Agent settings for a specified zone.
#----------------------------------------------------------------------------------------
#NAME:Import-CdmData
#SYNOPSIS:Imports roles and rights into a specified zone.
# --------------------------  Import roles and rights into a zone  --------------------------
#This example imports roles and rights from the "demo.xml" export file into the “chicago” zone.
Import-CdmData –Zone “cn=chicago,cn=Zones,dc=acme,dc=com” –FilePath “c:\demo.xml”
#----------------------------------------------------------------------------------------
#NAME:New-CdmApplicationRight
#SYNOPSIS:Creates a new Windows application right in a specified zone.
# --------------------------  Create a new application right in a zone  --------------------------
New-CdmApplicationRight –Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "winapp1" –MatchCriteria @($criteria1, $criteria2) –RunasUser 
"amy.adams@acme.com"
This example creates a new application right named "winapp1" with specified criteria in the "Finance" zone.
#----------------------------------------------------------------------------------------
#NAME:New-CdmCommandRight
#SYNOPSIS:Creates a new command right in a zone.
# --------------------------  Create a new command right.  --------------------------
#Creates command right "command1" for the "ls" command in zone1.
New-CdmCommandRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "command1" –Pattern "ls"
#----------------------------------------------------------------------------------------
#NAME:New-CdmComputerRole
#SYNOPSIS:Creates a new computer role in a zone.
# --------------------------  Create a computer role in a zone.  --------------------------
#Creates a computer role in zone "zone1", named "cr1", and sets the group "group1" as the computer group.
New-CdmComputerRole -Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "cr1" –Group "cn=group1,cn=Users,dc=domain,dc=com"
#----------------------------------------------------------------------------------------
#NAME:New-CdmDesktopRight
#SYNOPSIS:Creates a new Windows desktop right.
# --------------------------  Create a new Windows desktop right.  --------------------------
#Creates a new Windows desktop right named "desktop1" in zone1.
New-CdmDesktopRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "desktop1" –RunasSelfGroups 
"group1@domain.com","group2@domain.com"
#----------------------------------------------------------------------------------------
#NAME:New-CdmGroupProfile
#SYNOPSIS:Creates a new UNIX group profile.
# --------------------------  Create a profile for a group.  --------------------------
#Creates a profile for group “group1” in computer “comp1”.
New-CdmGroupProfile -Computer "cn=comp1,cn=Computers,dc=domain,dc=com" –Group "cn=group1,cn=Users,dc=domain,dc=com" –Name group1 –Gid 
10000
#----------------------------------------------------------------------------------------
#NAME:New-CdmLocalGroupProfile
#SYNOPSIS:Creates a new local UNIX group profile.
# --------------------------  Create a profile for a local group in a zone.  --------------------------
#This example creates a new group profile for the “backup” group in the "demo" zone with three members. The "Zone", "Name", and "Gid" 
#parameters are required to create the profile.
New-CdmLocalGroupProfile -Zone "cn=demo,cn=Zones,dc=example,dc=com" –Name backup –Gid 12345 –Members @(“james”, “tai”, “alma”)
#----------------------------------------------------------------------------------------
#NAME:New-CdmLocalUserProfile
#SYNOPSIS:Creates a new local UNIX user profile.
# --------------------------  Create a profile for local user.  --------------------------
#This example creates a local user profile for the "localuser1" account in the "demo" zone and sets the UID and primary GID attributes 
#in the local user profile. For this local user to be visible on the computers in the "demo" zone, however, the the following must be 
#true:
#• All profile attributes must be set or inherited from a parent.
#• The state must be set to Enable.
#• The user must be assigned with a role with visible option selected.
New-CdmLocalUserProfile -Zone "cn=demo,cn=Zones,dc=example,dc=com" –Name localuser1 –uid 12345 –PrimaryGroupId 12345
#----------------------------------------------------------------------------------------
#NAME:New-CdmManagedComputer
#SYNOPSIS:Pre-creates a computer or computer zone.
# --------------------------  Precreate a UNIX computer and create a new AD computer  --------------------------
#Pre-creates a UNIX computer and creates a new Active Directory computer named “comp” under "cn=Computers,dc=acem,dc=com", using a specified  SPN and delegating adjoin permission to user “user1”.
New-CdmManagedComputer -Zone "cn=Finance,cn=Zones,ou=Centrify,dc=acme,dc=com" -Container "cn=Computers,dc=acme,dc=com" –Name comp –spn "cifs/comp1,cifs/comp1.acme.com,ftp/comp1,ftp/comp1.acme.com" -delegate "cn=user1,cn=Users,dc=acme,dc=com"
# --------------------------  Precreate a Windows computer.  --------------------------
#Pre-creates a Windows computer in a Centrify zone using an existing Active Directory computer.
New-CdmManagedComputer -Zone "cn=Finance,cn=Zones,ou=Centrify,dc=acme,dc=com" -WindowsComputer "cn=comp1,cn=Computers,dc=acme,dc=com"
# --------------------------  Precreate a computer zone.  --------------------------
#Pre-creates a computer zone, delegating computer-level override permission to "user1".
New-CdmManagedComputer -Zone "cn=Finance,cn=Zones,ou=Centrify,dc=acme,dc=com"
–ComputerZone –DnsName "comp1.acme.com" -delegate "cn=user1,cn=Users,dc=acme,dc=com"
#----------------------------------------------------------------------------------------
#NAME:New-CdmMatchCriteria
#SYNOPSIS:Creates a new match criteria for specifying applications.
# --------------------------  Create a match criteria  --------------------------
#This example creates a match criteria DirectManage Access Manager console.
New-CdmMatchCriteria –Description "Centrifydc" -FileName "centrifydc" -FileType "msc" -Path "C:\Program Files\Centrify\DirectManage Access Manager\" -Argument "/r"
#----------------------------------------------------------------------------------------
#NAME:New-CdmNetworkAccessRight
#SYNOPSIS:Creates a new Windows network access right.
# --------------------------  Create a new Windows network access right.  --------------------------
#Creates a new Windows network access right named "net1" in zone1 that runs as user1 in domain.com.
New-CdmNetworkAccessRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "net1" –RunasUser "user1@domain.com"
#----------------------------------------------------------------------------------------
#NAME:New-CdmNisMap
#SYNOPSIS:Creates a new NIS map in a specified zone.
# --------------------------  Create a new NIS map in a zone  --------------------------
#This example creates a new NIS map named “nismap1” in the "Finance" zone.
New-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "nismap1"
#----------------------------------------------------------------------------------------
#NAME:New-CdmNisMapEntry
#SYNOPSIS:Creates a new NIS map entry in a specified NIS map.
# --------------------------  Create a new map entry in a Generic NIS map  --------------------------
#This example creates a new map entry with “/home/entry1” as its key. The value associated with the key is “192.168.5.175:/home/entry1” 
#and the entry includes the comment “Sample entry” in the NIS map named “generic" in the "Finance" zone.
$generic = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "generic"
New-CdmNisMapEntry -NisMap $generic –Key "/home/entry1" -Value "192.155.4.6:/home/entry1" -Comment "Sample entry"
# --------------------------  Create a new map entry in an Aliases NIS map  --------------------------
#This example creates a new Aliases map entry with a key of “widgetco”, a value of “widgetco:aaron@widgetco.com,zuza@widgetco.com” and 
#the comment “Sample entry for an aliases NIS map” in the "aliases" map in the Finance zone.
$aliases = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "aliases"
New-CdmNisMapEntry -NisMap $aliases –Key "widgetco" -Value "widgetco:aaron@widgetco.com,zuza@widgetco.com" -Comment "Sample entry for an aliases NIS map"
# --------------------------  Create a new map entry in an Audit_user map  --------------------------
#This example creates a new entry in the audit_user map entry with a key of “root”, a value of “root:lo:no” and the comment “Sample audit_user entry” in the “audit_user" map in the "Finance" zone.
$audit_user = Get-CdmNisMap -Zone "cn=Fiance,cn=Zones,dc=acme,dc=com" –Name "audit_user"
New-CdmNisMapEntry -NisMap $audit_user –Key "root" -Value "root:lo:no" -Comment "Sample audit_user entry"
# --------------------------  Create a new map entry in an Auth_attr map  --------------------------
#This example creates a new map entry in the "auth_attr" NIS map with a key of “solaris” and the value “solaris:::All Solaris Authorization:Long description:help=AllSolAuthsHeader.html” and a comment of “Sample auth_attr entry” in the "Finance" zone.
$auth_attr = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "auth_attr"
New-CdmNisMapEntry -NisMap $auth_attr –Key "solaris" -Value "solaris:::All Solaris Authorizations:Long description:help=AllSolAuthsHeader.html" -Comment "Sample auth_attr entry"
# --------------------------  Create a new map entry in an Automaster map  --------------------------
#This example creates a new map entry in the "auto_master" map with the key “/-” and the value “program:/etc/auto.direct -nobrowse” and the comment “direct map” in the "Finance" zone.
$auto_master = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "auto_master"
New-CdmNisMapEntry -NisMap $auto_master –Key "/-" -Value "program:/etc/auto.direct -nobrowse" -Comment "direct map"
# --------------------------  Create a new map entry in an Automount map  --------------------------
$auto_mount = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "auto_mount"
New-CdmNisMapEntry -NisMap $auto_mount –Key "lnssk1u01" # -Value "-fstype=nfs,rw 192.168.5.175:/home/lnssk1u01" # -Comment "indirect map"
This example creates a new "auto_mount" map entry with the key “lnssk1u01” and a value of “-fstype=nfs,rw 192.168.5.175:/home/lnssk1u01” and the comment “indirect map” in the "Finance" zone.
# --------------------------  Create a new map entry in a Bootparams map  --------------------------
#This example creates a new map entry in the "bootparams" map with the key “client1” and the value “root=smoketest1:/export/client1/root rootopts=:vers=2 domain=bldg1.workco.com” with the comment “The value part consists of the keyword=value pair” in the "Finance" zone.
$bootparams = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "bootparams"
New-CdmNisMapEntry -NisMap $bootparams –Key "client1" -Value "root=smoketest1:/export/client1/rootrootopts=:vers=2 domain=bldg1.workco.com" -Comment "The value part consists of the keyword=value pair"
# --------------------------  Create a new map entry in an Ethers map  --------------------------
#This example creates a new map entry in the "ethers" map with the key "pal" and value of "12:34:56:78:9a:bc pal" and the comment "pal is the hostname" in the "Finance" zone.
$ethers = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "ethers"
New-CdmNisMapEntry -NisMap $ethers –Key "pal" -Value "12:34:56:78:9a:bc pal" -Comment "pal is the hostname"
# --------------------------  Create a new map entry in an Exec_attr map  --------------------------
#This example creates a new map entry in the "exec_attr" map with the key "Application Server Management", the value "Application Server Management:suser:cmd:::/usr/appserver/bin/asadmin:attr", and the comment "Sample exec_attr map entry" in the "Finance" zone.
$exec_attr = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "exec_attr"
New-CdmNisMapEntry -NisMap $exec_attr –Key "Application Server Management" -Value "Application Server Management:suser:cmd:::/usr/appserver/bin/asadmin:attr" # -Comment "Sample exec_attr map entry"
# --------------------------  Create a new map entry in a Hosts map  --------------------------
#This example creates a new map entry in the "hosts" map with a key of "127.0.0.1", a value of "127.0.0.1 localhost.localdomain localhost", and the comment "localhost is host name" in the "Finance" zone.
$hosts = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "hosts"
New-CdmNisMapEntry -NisMap $hosts –Key "127.0.0.1" -Value "127.0.0.1 localhost.localdomain localhost" -Comment "localhost is host name"
# --------------------------  Create a new map entry in a Netgroup map  --------------------------
#This example creates a new map entry in the "netgroup" map with the key "netgroup", the value "(host,user1,NIS-domain)(host,user2,NIS-domain)", and the comment "The (host,user,NIS-domain) and the (host,user2,NIS-domain) are netgroups" in the "Finance" zone.
$netgroup = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "netgroup"
New-CdmNisMapEntry -NisMap $netgroup –Key "netgroup" -Value "(host,user1,NIS-domain)(host,user2,NIS-domain)" -Comment "The (host,user,NIS-domain) and the (host,user2,NIS-domain) are netgroups"
# --------------------------  Create a new map entry in a Netmasks map  --------------------------
#This example creates a new map entry in the "netmasks" map with the key "192.168.4.0", the value "255.255.252.0", and the comment "The 255.255.252.0 is network mask" in the "Finance" zone.
$netmasks = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "netmasks"
New-CdmNisMapEntry -NisMap $netmasks –Key "192.168.4.0" -Value "255.255.252.0" -Comment "The 255.255.252.0 is network mask"
# --------------------------  Create a new map entry in a Networks map  --------------------------
#This example creates a new map entry in the "networks" map with the key "arpa", the value "arpa 10 arpanet", and the comment "arpanet is alias" in the "Finance" zone.
$networks = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "networks"
New-CdmNisMapEntry -NisMap $networks –Key "arpa" -Value "arpa 10 arpanet" -Comment "arpanet is alias"
# --------------------------  Create a new map entry in a Prof_attr map  --------------------------
#This example creates a new map entry in the "prof_attr" map with the key "All", the value "All:::Execute any command as the user or role:help=RtAll.html", and the comment "Sample prof_attr entry" in the "Finance" zone.
$prof_attr = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "prof_attr"
New-CdmNisMapEntry -NisMap $prof_attr –Key "All" -Value "All:::Execute any command as the user or role:help=RtAll.html" -Comment "Sample prof_attr entry"
# --------------------------  Create a new map entry in a Printers map  --------------------------
#This example creates a new map entry in the "printers" map with the key “bulldog_log”, the value “bulldog_log::paddr=bulldog.gandalf.xyz.com,105004,1,sys,lp,bulldog_spl,1::spooling-type=dpa:” and the comment “The value part consists of the keyword=value pair” in the "Finance" zone.
$printers = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "printers"
New-CdmNisMapEntry -NisMap $printers –Key "bulldog_log" -Value "bulldog_log::paddr=bulldog.gandalf.xyz.com,105004,1,sys,lp,bulldog_spl,1::spooling-type=dpa:" -Comment "The value part consists of the keyword=value pair"
# --------------------------  Create a new map entry in a Project map  --------------------------
$project = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "project"
New-CdmNisMapEntry -NisMap $project –Key "testfull" -Value "testfull:509:The Test Groups:john,paul,george,ringo:group1,group2,group3:task.max-lwps=(privileged,509,signal=SIGTERM),(privileged,509,deny);process.max-file-descriptor" -Comment "Sample project entry"
#This example creates a new map entry in the "project" map with the key "testfull", the value "testfull:509:The Test Groups:john,paul,george,ringo:group1,group2,group3:task.max-lwps=(privileged,509,signal=SIGTERM),(privileged,509,deny);process.max-file-descriptor", and the comment "Sample project entry" in the "Finance" zone.
# --------------------------  Create a new map entry in a Protocols map  --------------------------
#This example creates a new map entry in the "protocols" map with the key "ip", the value "ip 0 IP", and the comment "IP is an alias" in the "Finance" zone.
$protocols = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "protocols"
New-CdmNisMapEntry -NisMap $protocols –Key "ip" -Value "ip 0 IP" -Comment "IP is an alias"
# --------------------------  Create a new map entry in an RPC map  --------------------------
#This example creates a new map entry in the "rpc" map with the key "portmapper", the value "portmapper 100000 portmap sunrpc", and the comment "portmap and sunrpc are aliases" in the "Finance" zone.
$rpc = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "rpc"
New-CdmNisMapEntry -NisMap $rpc –Key "portmapper" -Value "portmapper 100000 portmap sunrpc" -Comment "portmap and sunrpc are aliases"
# --------------------------  Create a new map entry in a Services map  --------------------------
#This example creates a new map entry in the "services" map with the key "uucp", the value "uucp 540/tcp uucpd", and the comment "uucpd is an alias" in the "Finance" zone.
$services = Get-CdmNisMap -Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "services"
New-CdmNisMapEntry -NisMap $services –Key "uucp" -Value "uucp 540/tcp uucpd" -Comment "uucpd is an alias"
# --------------------------  Create a new map entry in a User_attr map  --------------------------
#This example creates a new map entry in the "user_attr" map with the key "root", the value "root::::auths=solaris.*,solaris.grant;profiles=Web Console Management,All;lock_after_retries=no;min_label=admin_low;clearance=admin_high", and the comment "Sample user_attr entry" in the "Finance" zone.
$user_attr = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "user_attr"
New-CdmNisMapEntry -NisMap $user_attr –Key "root" -Value "root::::auths=solaris.*,solaris.grant;profiles=Web Console Management,All;lock_after_retries=no;min_label=admin_low;clearance=admin_high" -Comment "Sample user_attr entry"
#----------------------------------------------------------------------------------------
#NAME:New-CdmPamRight
#SYNOPSIS:Creates a new PAM application access right.
# --------------------------  Create a new PAM access right.  --------------------------
#Creates a new PAM access right named "ssh" for application ssh in zone Z1.
New-CdmPamRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "ssh" –Application "ssh"
#----------------------------------------------------------------------------------------
#NAME:New-CdmRole
#SYNOPSIS:Creates a new role in a zone.
# --------------------------  Create a new role in a zone.  --------------------------
#Creates a new role named "role1" in zone "zone1".
New-CdmRole -Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "role1"
#----------------------------------------------------------------------------------------
#NAME:New-CdmRoleAssignment
#SYNOPSIS:Creates a new role assignment.
# --------------------------  Assign a local user to a role.  --------------------------
#Gets role1 from zone1, gets computer role cr1 from zone2, and assigns local UNIX user "jon.doe" to role1 in computer role cr1.
$role = Get-CdmRole -Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name role1
$cr = Get-CdmComputerRole -Zone "cn=zone2,cn=Zones,dc=domain,dc=com" –Name "cr1"
New-CdmRoleAssignment -ComputerRole $cr -Role $role –TrusteeType "LocalUnixUser" –LocalTrustee "jon.doe"
#----------------------------------------------------------------------------------------
#NAME:New-CdmUserProfile
#SYNOPSIS:Creates a new UNIX user profile.
# --------------------------  Create a profile for a user.  --------------------------
#Creates a profile for user “user1” in zone “zone1”, setting only login name and UID.
New-CdmUserProfile -Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –User "cn=user1,cn=Users,dc=domain,dc=com" –login user1 –uid 12345
#----------------------------------------------------------------------------------------
#NAME:New-CdmZone
#SYNOPSIS:Creates a new zone.
# --------------------------  Create a new zone  --------------------------
#Create a hierarchical zone named “zone1” at “cn=Zones, dc=domain, dc=com”.
New-CdmZone -Name "zone1" -Container "cn=Zones,dc=domain,dc=com" –Type hierarchical –Schema standard
#----------------------------------------------------------------------------------------
#NAME:Remove-CdmApplicationRight
#SYNOPSIS:Deletes a Windows application right or removes it from a role.
# --------------------------  Delete an application right from a zone  --------------------------
#This example deletes the application right named “winapp1” from the "Finance" zone.
Get-CdmApplicationRight –Zone "cn=Fianance,cn=Zones,dc=acme,dc=com" –Name "winapp1" | Remove-CdmApplicationRight
# --------------------------  Remove an application right from a role  --------------------------
#This example removes the application right named “winapp1” from the role “role1” in the "Finance" zone.
$role = Get-CdmRole –Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "role1"
Get-CdmApplicationRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "winapp1" | Remove-CdmApplicationRight –Role $role1
#----------------------------------------------------------------------------------------
#NAME:Remove-CdmCommandRight
#SYNOPSIS:Deletes a command right or removes it from a role.
# --------------------------  Delete a command right from a zone.  --------------------------
#Gets command right "cmd1" from zone1 and deletes the right from the zone.
Get-CdmCommandRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "cmd1" | Remove-CdmCommandRight
# --------------------------  Remove a command right from a role.  --------------------------
#Gets role1 in zone1, then gets right cmd1 in zone1 and removes the right from the role, leaving it in the zone.
$role = Get-CdmRole –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "role1"
Get-CdmCommandRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "cmd1" | Remove-CdmCommandRight –Role $role
#----------------------------------------------------------------------------------------
#NAME:Remove-CdmComputerRole
#SYNOPSIS:Deletes a computer role from a zone.
# --------------------------  Delete the computer roles in a zone.  --------------------------
#Gets all the computer roles in zone "zone1" and deletes them.
Get-CdmComputerRole -Zone "cn=zone1,cn=Zones,dc=domain,dc=com" | Remove-CdmComputerRole
#----------------------------------------------------------------------------------------
#NAME:Remove-CdmDesktopRight
#SYNOPSIS:Deletes a Windows desktop right or removes it from a role.
# --------------------------  Delete a Windows desktop right from a zone.  --------------------------
#Gets Windows desktop right "dt1" from zone1 and deletes the right from the zone.
Get-CdmDesktopRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "dt1" | Remove-CdmDesktopRight
# --------------------------  Remove a Windows desktop right from a role.  --------------------------
#Gets role1 from zone1, gets Windows desktop right "dt1" from zone1, and removes the right from the role.
$role = Get-CdmRole –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "role1"
Get-CdmDesktopRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "dt1" | Remove-CdmDesktopRight –Role $role
#----------------------------------------------------------------------------------------
#NAME:Remove-CdmGroupProfile
#SYNOPSIS:Deletes a UNIX group profile.
# --------------------------  Delete the group profiles in a zone.  --------------------------
#Gets all the group UNIX profiles in zone "zone1" and deletes them.
Get-CdmGroupProfile -Zone "cn=zone1,cn=Zones,dc=domain,dc=com" | Remove-CdmGroupProfile
#----------------------------------------------------------------------------------------
#NAME:Remove-CdmLocalGroupProfile
#SYNOPSIS:Deletes a local group UNIX profile.
# --------------------------  Remove all local group profiles in a zone.  --------------------------
#This example gets all of the local group profiles in the "demo" zone, then deletes them.
Get-CdmLocalGroupProfile -Zone "cn=demo,cn=Zones,dc=example,dc=com" | Remove-CdmLocalGroupProfile
#----------------------------------------------------------------------------------------
#NAME:Remove-CdmLocalUserProfile
#SYNOPSIS:Deletes a local user UNIX profile.
# --------------------------  Remove all local user profiles in a zone.  --------------------------
#This example gets all of the local user profiles in the "demo" zone, then deletes them.
Get-CdmLocalUserProfile -Zone "cn=demo,cn=Zones,dc=example,dc=com" | Remove-CdmLocalUserProfile
#----------------------------------------------------------------------------------------
#NAME:Remove-CdmManagedComputer
#SYNOPSIS:Removes a managed computer from a zone.
# --------------------------  Remove computers from a zone.  --------------------------
#Gets all the computers in "zone1" and removes them from the zone.
Get-CdmManagedComputer –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" | Remove-CdmManagedComputer
#----------------------------------------------------------------------------------------
#NAME:Remove-CdmNetworkAccessRight
#SYNOPSIS:Deletes a Windows network access right or removes it from a role.
# --------------------------  Delete a Windows network access right from a zone.  --------------------------
#Gets Windows network access right "net1" in zone1 and deletes the right from the zone.
Get-CdmNetworkAccessRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "net1" | Remove-CdmNetworkAccessRight
# --------------------------  Remove a Windows network access right from a role.  --------------------------
#Gets role1 in zone1, gets Windows network access right "net1" in zone1, and removes the access right from the role.
$role = Get-CdmRole –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "role1" 
Get-CdmNetworkAccessRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "net1" | Remove-CdmNetworkAccessRight –Role $role1
#----------------------------------------------------------------------------------------
#NAME:Remove-CdmNisMap
#SYNOPSIS:Deletes a NIS map from a zone.
# --------------------------  Remove a NIS map from a zone  --------------------------
#This example removes the NIS map named “nismap1” from the "Finance" zone.
Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "nismap1" | Remove-CdmNisMap
#----------------------------------------------------------------------------------------
#NAME:Remove-CdmNisMapEntry
#SYNOPSIS:Deletes a map entry from a NIS map.
# --------------------------  Delete a map entry and retain its tombstone object  --------------------------
#This example removes the map entry “/home/entry1” from the NIS map named “nismap1” without deleting its tombstone object.
Get-CdmNisMapEntry -NisMap $nismap1 -Key "/home/entry1" | Remove-CdmNisMapEntry
# --------------------------  Delete a map entry and its tombstone object  --------------------------
#Remove both “/home/entry2” and its tombstone from NIS map “nismap1” Get-CdmNisMapEntry -NisMap $nismap1 -Key "/home/entry2" | Remove-CdmNisMapEntry -DeleteTombstone
Get-CdmNisMapEntry -NisMap $nismap1 -Key "/home/entry2" | Remove-CdmNisMapEntry -DeleteTombstone
#----------------------------------------------------------------------------------------
#NAME:Remove-CdmPamRight
#SYNOPSIS:Deletes a PAM application access right or removes it from a role.
# --------------------------  Delete a PAM access right from a zone.  --------------------------
Get-CdmPamRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "ssh" | Remove-CdmPamRight
Gets the PAM access right named "ssh" in zone1 and deletes it.
# --------------------------  Remove a PAM access right from a role.  --------------------------
#Gets the role role1 in zone zone1, gets the PAM access right "ssh" in zone1, and removes the right from the role.
$role = Get-CdmRole –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "role1"
Get-CdmPamRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "ssh" | Remove-CdmPamRight –Role $role
#----------------------------------------------------------------------------------------
#NAME:Remove-CdmPersistedCredential
#SYNOPSIS:Removes encrypted credentials from the registry.
#----------------------------------------------------------------------------------------
#NAME:Remove-CdmRole
#SYNOPSIS:Deletes a role.
# --------------------------  Delete a role.  --------------------------
#Gets role1 from zone1 and deletes it.
Get-CdmRole -Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "role1" | Remove-CdmRole
#----------------------------------------------------------------------------------------
#NAME:Remove-CdmRoleAssignment
#SYNOPSIS:Deletes a role assignment from a zone.
# --------------------------  Delete all role assignments in a zone.  --------------------------
#Gets all the role assignments in Zone1 and deletes them.
Get-CdmRoleAssignment -Zone "cn=zone1,cn=Zones,dc=domain,dc=com" | Remove-CdmRoleAssignment
#----------------------------------------------------------------------------------------
#NAME:Remove-CdmSshRight
#SYNOPSIS:Removes an SSH right from a role.
# --------------------------  Remove an SSH right from a role.  --------------------------
#Gets role1 in zone1, gets SSH right "dzssh-all" in zone1, and removes the right from the role.
$role = Get-CdmRole –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "role1"
Get-CdmSshRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "dzssh-all" | Remove-CdmSshRight –Role $role1
#----------------------------------------------------------------------------------------
#NAME:Remove-CdmUserProfile
#SYNOPSIS:Deletes a UNIX user profile.
# --------------------------  Remove all UNIX user profiles in a zone.  --------------------------
#Gets all the UNIX user profiles in zone1 and deletes them.
Get-CdmUserProfile -Zone "cn=zone1,cn=Zones,dc=domain,dc=com" | Remove-CdmUserProfile
#----------------------------------------------------------------------------------------
#NAME:Remove-CdmZone
#SYNOPSIS:Deletes an existing zone.
# --------------------------  Delete all hierarchical zones  --------------------------
#Gets all hierarchical zones and then deletes them.
Get-CdmZone –Type Hierarchical | Remove-CdmZone
#----------------------------------------------------------------------------------------
#NAME:Set-CdmApplicationRight
#SYNOPSIS:Updates an existing Windows application right.
# --------------------------  Update an application right runas user  --------------------------
#This example updates the application right named “winapp1” in the "Finance" zone to use "amy.adams" as the run-as user account.
Get-CdmApplicationRight –Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "winapp1" | Set-CdmApplicationRight –RunasUser "cn=amy.adams,cn=Users,dc=acme,dc=com"
# --------------------------  Update an application right to run with group permissions.  --------------------------
#This example updates the Windows application right named "winapp1" to run under the logon user's account with the added privileges of the "AcctAdmins" Active Directory group.
Get-CdmApplicationRight –Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "winapp1" | Set-CdmApplicationRight –RunasSelfGroups "cn=AcctAdmins,cn=Groups,dc=acme,dc=com"
#----------------------------------------------------------------------------------------
#NAME:Set-CdmCommandRight
#SYNOPSIS:Updates an existing command right.
# --------------------------  Rename a command right.  --------------------------
#Gets the command right named "cmd1" in zone1 and renames it to "cmd2".
Get-CdmCommandRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "cmd1" | Set-CdmCommandRight –Name "cmd2"
#----------------------------------------------------------------------------------------
#NAME:Set-CdmComputerRole
#SYNOPSIS:Updates an existing computer role.
# --------------------------  Update the description of all computer roles in a zone.  --------------------------
#Gets all the computer roles in zone1 and updates their descriptions to say "new description".
Get-CdmComputerRole -Zone "cn=zone1,cn=Zones,dc=domain,dc=com" | Set-CdmComputerRole –description "new description"
#----------------------------------------------------------------------------------------
#NAME:Set-CdmCredential
#SYNOPSIS:Adds a user credential.
# --------------------------  Set the credential for a specified domain and user  --------------------------
#This example caches the credential "ACME\admin" for connecting to the "acme.com" domain.
Set-CdmCredential -Domain "acme.com" –Credential "ACME\admin"
# --------------------------  Set the credential using a persisted credential  --------------------------
#This example sets the credential to use a previously-persisted persisted credential that has been encrypted and stored in the registry for the specified domain.
Set-CdmCredential –PersistedCredential (Get-CdmPersistedCredential –Domain “domain.com”)
#----------------------------------------------------------------------------------------
#NAME:Set-CdmDelegation
#SYNOPSIS:Updates the delegation of administrative tasks.
# --------------------------  Delegate Zone administrative tasks to Active Directory users  --------------------------
#This example delegates the zone administration tasks “AddUsers” and “AddGroups” tasks for the "Finance" zone to the  Active Directory users "amy.adams@acme.com" and "frank.smith@acme.com".
$zone = Get-CdmZone -Dn "cn=Finance,cn=Zones,ou=Centrify,dc=acme,dc=com"
Set-CdmDelegation –Zone $zone –Task "AddUsers","AddGroups" –Trustee "amy.adams@acme.com","frank.smith@acme.com"
# --------------------------  Delegate Computer administrative tasks to Active Directory users  --------------------------
#This example delegates the computer administration tasks “AddUsers” and “AddGroups” tasks for the computer named "comp1" to the  Active Directory  users "amy.adams@acme.com" and "frank.smith@acme.com".
$comp = Get-CdmManagedComputer -Computer "cn=comp1,cn=Computers,dc=acme,dc=com"
Set-CdmDelegation –Computer $comp –Task "AddUsers","AddGroups" –Trustee  "amy.adams@acme.com","frank.smith@acme.com"
# --------------------------  Delegate Computer Role administrative tasks to Active Directory users  --------------------------
#This example delegates “All” tasks for the computer role “comrole1” to the Active Directory users "amy.adams@acme.com" and "frank.smith@acme.com".
$cr = Get-CdmComputerRole -Zone "cn=Finance,cn=Zones,dc=acme,dc=com" –Name "comrole1"
Set-CdmDelegation –ComputerRole $cr –Task "All" –Trustee "amy.adams@acme.com","frank.smith@acme.com"
#----------------------------------------------------------------------------------------
#NAME:Set-CdmDesktopRight
#SYNOPSIS:Updates an existing Windows desktop right.
# --------------------------  Update the runas user of a Windows desktop right.  --------------------------
#Gets the Windows desktop right "admin-desktop" in the "Finance" zone and sets the run-as user to be frank.smith.
Get-CdmDesktopRight –Zone "cn=Finance,cn=Zones,ou=Centrify,dc=acme,dc=com" –Name "admin-desktop" | Set-CdmDesktopRight –RunasUser "cn=frank.smith,cn=Users,dc=acme,dc=com"
#----------------------------------------------------------------------------------------
#NAME:Set-CdmGroupProfile
#SYNOPSIS:Updates an existing UNIX group profile.
# --------------------------  Update the name of a group UNIX profile.  --------------------------
#Gets the UNIX group profile of UNIX group "group1" in computer "comp1" and changes the name to "newname".
Get-CdmGroupProfile -Computer "cn=comp1,cn=Computers,dc=domain,dc=com" -Group "cn=group1,cn=Users,dc=domain,dc=com" | 
Set-CdmGroupProfile –Name "newname"
#----------------------------------------------------------------------------------------
#NAME:Set-CdmLocalGroupProfile
#SYNOPSIS:Updates an existing local group UNIX profile.
# --------------------------  Update a local group profile attribute.  --------------------------
#This example updates the GID profile attribute to "300001" for the “localgroup1” local profile on the "suse11" computer.
Get-CdmLocalGroupProfile -Computer "cn=suse11,cn=Computers,dc=domain,dc=com" –Name "localgroup1" | Set-CdmLocalGroupProfile –Gid 300001
#----------------------------------------------------------------------------------------
#NAME:Set-CdmLocalUserProfile
#SYNOPSIS:Updates an existing local user UNIX profile.
# --------------------------  Update a local user profile attribute.  --------------------------
#This example gets the local user profile for the “localuser1” user on the computer “suse11” and Updates the home directory of the local profile to use the “%{home}/%{user}” runtime variables.
Get-CdmLocalUserProfile -Computer "cn=suse11,cn=Computers,dc=domain,dc=com" –Name "localuser1" | Set-CdmLocalUserProfile –HomeDir "%{home}/%{user}"
#----------------------------------------------------------------------------------------
#NAME:Set-CdmNetworkAccessRight
#SYNOPSIS:Updates an existing Windows network access right.
# --------------------------  Update the runas account for a Windows network access right  --------------------------
#This example gets the Windows network access right named "net1" in "zone1" and updates it to run under the "user1" account.
Get-CdmNetworkAccessRight –Zone "cn=zone1,cn=Zones,dc=domain,dc=com" –Name "net1" | Set-CdmNetworkAccessRight –RunasUser "cn=user1,cn=Users,dc=domain,dc=com"
#----------------------------------------------------------------------------------------
#NAME:Set-CdmNisMap
#SYNOPSIS:Updates an existing NIS map.
# --------------------------  Rename a NIS map  --------------------------
#This example renames the custom NIS map “nismap1” in the "Finance" zone =to “nismap2”.
Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "nismap1" | Set-CdmNisMap –Name "nismap2"
#----------------------------------------------------------------------------------------
#NAME:Set-CdmNisMapEntry
#SYNOPSIS:Updates an existing NIS map entry.
# --------------------------  Update a NIS map entry in a Generic map  --------------------------
#This example updates the “generic" map entry with the key “/home/entry” to have its value set to “192.155.4.6:/home/entry1” in the "Finance" zone.
$generic = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "generic"
Get-CdmNisMapEntry -NisMap $generic –Key "/home/entry" | Set-CdmNisMapEntry –Value "192.155.4.6:/home/entry1"
# --------------------------  Update a NIS map entry in an Aliases map  --------------------------
#This example updates the "aliases" map entry with the key “Company” to have its value set to “Company:sometest@company.com” in the "Finance" zone.
$aliases = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "aliases"
Get-CdmNisMapEntry -NisMap $aliases –Key "Company" | Set-CdmNisMapEntry –Value "Company:sometest@company.com"
# --------------------------  Update a NIS map entry in an Audit_user map  --------------------------
#This example updates the "audit_user" map with the entry “root” to set its value to “root:lo:test” in the "Finance" zone.
$audit_user = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "audit_user"
Get-CdmNisMapEntry -NisMap $audit_user –Key "root" | Set-CdmNisMapEntry –Value "root:lo:test"
# --------------------------  Update a NIS map entry in the Auth_attr map  --------------------------
#This example updates the "auth_attr" map entry for "solaris" to set its value to "solaris:::All Solaris Authorizations test:Long description test:help=AllSolAuthsHeader.html" in the "Finance" zone.
$auth_attr = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "auth_attr"
Get-CdmNisMapEntry -NisMap $auth_attr –Key "solaris" | Set-CdmNisMapEntry –Value "solaris:::All Solaris Authorizations test:Long description test:help=AllSolAuthsHeader.html"
# --------------------------  Update a NIS map entry in the Auto_master map  --------------------------
#This example updates the "auto_master" map entry for "/-" to set its value to "program:/etc/auto.direct -nosuid" in the "Finance" zone.
$auto_master = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "auto_master"
Get-CdmNisMapEntry -NisMap $auto_master –Key "/-" | Set-CdmNisMapEntry –Value "program:/etc/auto.direct -nosuid"
# --------------------------  Update a NIS map entry in the Automount map  --------------------------
#This example updates the "auto_mount" map entry for "lnssk1u01" to set its value to "-fstype=nfs  192.168.5.175:/home/lnssk1u01" in the "Finance" zone.
$auto_mount = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "auto_mount"
Get-CdmNisMapEntry -NisMap $auto_mount –Key "lnssk1u01" | Set-CdmNisMapEntry –Value "-fstype=nfs  192.168.5.175:/home/lnssk1u01"
# --------------------------  Update a NIS map entry in the Bootparams map  --------------------------
$bootparams = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "bootparams"
Get-CdmNisMapEntry -NisMap $bootparams –Key "client1" | Set-CdmNisMapEntry –Value "root=smoketest1:/export/client1/root rootopts=:vers=2 domain=tsetdomain.com"
#This example updates the "bootparams" map entry "client1" to set its value to "root=smoketest1:/export/client1/root rootopts=:vers=2 domain=tsetdomain.com" in the "Finance" zone.
# --------------------------  Update a NIS map entry in the Ethers map  --------------------------
#This example updates the "ethers" map entry “pal”  to set its value to “12:34:56:78:9a:dd pal” in the "Finance" zone.
$ethers = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "ethers"
Get-CdmNisMapEntry -NisMap $ethers –Key "pal" | Set-CdmNisMapEntry –Value "12:34:56:78:9a:dd pal"
# --------------------------  Update a NIS map entry in the Exec_attr map  --------------------------
#This example updates the "exec_attr" map entry "Application Server Management" to set its value to "Application Server Management:suser:cmd:::/usr/appserver/bin/asuser:attr test" in the "Finance" zone.
$exec_attr = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "exec_attr"
Get-CdmNisMapEntry -NisMap $exec_attr –Key "Application Server Management" | Set-CdmNisMapEntry –Value "Application Server Management:suser:cmd:::/usr/appserver/bin/asuser:attr test"
# --------------------------  Update a NIS map entry in the Hosts map  --------------------------
#This example updates the "hosts" map entry "127.0.0.1" to set its value to "127.0.0.1 localhost.testldomain localhost" in the "Finance" zone.
$hosts = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "hosts"
Get-CdmNisMapEntry -NisMap $hosts –Key "127.0.0.1" | Set-CdmNisMapEntry –Value "127.0.0.1 localhost.testldomain localhost"
# --------------------------  Update a NIS map entry in the Netgroup map  --------------------------
#This example updates the "netgroup" map entry "qa-adm" to set its value to "(host1,user1,NIS-domain)(host1,user2,NIS-domain)" in the "Finance" zone.
$netgroup = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "netgroup"
Get-CdmNisMapEntry -NisMap $netgroup –Key "qa-adm" | Set-CdmNisMapEntry –Value "(host1,user1,NIS-domain)(host1,user2,NIS-domain)"
# --------------------------  Update a NIS map entry in the Netmasks map  --------------------------
#This example updates the "netmasks" map entry  "192.168.4.0" to set its value to "255.255.250.0" in the "Finance" zone.
$netmasks = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "netmasks"
Get-CdmNisMapEntry -NisMap $netmasks –Key "192.168.4.0" | Set-CdmNisMapEntry –Value "255.255.250.0"
# --------------------------  Update a NIS map entry in the Networks map  --------------------------
#This example updates the "networks" map entry "arpa" to set its value to "arpa 10 testarpa" in the "Finance" zone.
$networks = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "networks"
Get-CdmNisMapEntry -NisMap $networks –Key "arpa" | Set-CdmNisMapEntry –Value "arpa 10 testarpa"
# --------------------------  Update a NIS map entry in the Prof_attr map  --------------------------
#This example updates the "prof_attr" map entry "All" to set its value to "All:::Execute any command as the user or role:help=RtAllTest.html" in the "Finance" zone.
$prof_attr = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "prof_attr"
Get-CdmNisMapEntry -NisMap $prof_attr –Key "All" | Set-CdmNisMapEntry –Value "All:::Execute any command as the user or role:help=RtAllTest.html"
# --------------------------  Update a NIS map entry in the Printers map  --------------------------
#This example updates the "printers" map entry "bulldog_log" to set its value to  "bulldog_log::paddr=bulldog.gandalf.xyz.com,105004,1,sys,lp,bulldogtest_spl,1::spooling-type=dpa:" in the "Finance" zone.
$printers = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "printers"
Get-CdmNisMapEntry -NisMap $printers –Key "bulldog_log" | Set-CdmNisMapEntry –Value "bulldog_log::paddr=bulldog.gandalf.xyz.com,105004,1,sys,lp,bulldogtest_spl,1::spooling-type=dpa:"
# --------------------------  Update a NIS map entry in the Project map  --------------------------
#This example updates the "project" map entry "testfull" to set its value to "testfull:509:The Update Groups:john,paul,george,ringo:grou p1,group2,group3:task.max-lwps=(privileged,509,signal=SIGTERM),(privileged,509,deny);process.max-file-descriptor" in the "Finance" zone.
$project = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "project"
Get-CdmNisMapEntry -NisMap $project –Key "testfull" | Set-CdmNisMapEntry –Value "testfull:509:The Update Groups:john,paul,george,ringo: group1,group2,group3:task.max-lwps=(privileged,509,signal=SIGTERM),(privileged,509,deny);process.max-file-descriptor"
# --------------------------  Update a NIS map entry in the Protocols map  --------------------------
#This example updates the "protocols" map entry "ip" to set its value to "ip 0 IPTest" in the "Finance" zone.
$protocols = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "protocols"
Get-CdmNisMapEntry -NisMap $protocols –Key "ip" | Set-CdmNisMapEntry –Value "ip 0 IPTest"
# --------------------------  Update a NIS map entry in the RPC map  --------------------------
#This example updates the "rpc" map entry for "portmapper" to set its value to  "portmapper 50000 rpc" in the "Finance" zone.
$rpc = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "rpc"
Get-CdmNisMapEntry -NisMap $rpc –Key "portmapper" | Set-CdmNisMapEntry –Value "portmapper 50000 rpc"
# --------------------------  Update a NIS map entry in the Services map  --------------------------
#This example updates the "services" map entry "uucp" to set its value to "uucp 629/udp testuucp" in the "Finance" zone.
$services = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "services"
Get-CdmNisMapEntry -NisMap $services –Key "uucp" | Set-CdmNisMapEntry –Value "uucp 629/udp testuucp"
# --------------------------  Update a NIS map entry in the User_attr map  --------------------------
#This example updates the "user_attr" map entry "root" to set its value to "root::::auths=solaris.*,solaris.grant;profiles=Web Console Management,All" in the "Finance" zone.
$user_attr = Get-CdmNisMap -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "user_attr"
Get-CdmNisMapEntry -NisMap $user_attr –Key "root" | Set-CdmNisMapEntry –Value "root::::auths=solaris.*,solaris.grant;profiles=Web Console Management,All"
#----------------------------------------------------------------------------------------
#NAME:Set-CdmPamRight
#SYNOPSIS:Updates an existing PAM application access right.
# --------------------------  Rename a PAM access right  --------------------------
#This example gets the PAM application access right named "ssh" in the "Finance" zone, then renames it to "sshd".
Get-CdmPamRight –Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name "ssh" | Set-CdmPamRight –Name "sshd"
#----------------------------------------------------------------------------------------
#NAME:Set-CdmPersistedCredential
#SYNOPSIS:Creates an encrypted credential.
#----------------------------------------------------------------------------------------
#NAME:Set-CdmPreferredServer
#SYNOPSIS:Specifies a preferred server.
# --------------------------  Specify a preferred server  --------------------------
#This example specifies that you want to use the server "dc1.domain.com" when connecting to the "acme.com" domain.
Set-CdmPreferredServer -Domain "acmen.com" –Server "dc1.acme.com"
#----------------------------------------------------------------------------------------
#NAME:Set-CdmRole
#SYNOPSIS:Updates an existing role.
# --------------------------  Rename a role  --------------------------
#This example gets the role named "role1" in the "Finance" zone then renames it to "role2".
Get-CdmRole -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" –Name role1 | Set-CdmRole –Name "role2"
#----------------------------------------------------------------------------------------
#NAME:Set-CdmRoleAssignment
#SYNOPSIS:Updates an existing role assignment.
# --------------------------  Update start and end times of all role assignments in a zone  --------------------------
#Gets all the role assignments in the "Finance" zone and sets their start time to 2/20/2014 and their end time to never expire.
Get-CdmRoleAssignment -Zone "cn=Finance,cn=Zones,dc=domain,dc=com" | Set-CdmRoleAssignment –StartTime ([DateTime] "2/20/2014") –NeverExpire
#----------------------------------------------------------------------------------------
#NAME:Set-CdmUserProfile
#SYNOPSIS:Updates an existing UNIX user profile.
# --------------------------  Update the home directory of an AD user profile  --------------------------
#Gets the UNIX profile of the Active Directory user named “user1” in computer “comp1” and updates the default home directory to “%{home}/%{user}” in the user's profile.
Get-CdmUserProfile -Computer "cn=comp1,cn=Computers,dc=domain,dc=com" -User "cn=user1,cn=Users,dc=domain,dc=com" | Set-CdmUserProfile –HomeDir "%{home}/%{user}"
#----------------------------------------------------------------------------------------
#NAME:Set-CdmZpaSetting
#SYNOPSIS:Updates the provisioning rules for a specified zone.
# --------------------------  Enable user provisioning for a zone  --------------------------
#This example enables the automated provisioning of UNIX user profiles in the "testzpa" zone and specifies the Active Directory group 
#"TestUsers@acme.com" as the group from which to provision new UNIX user profiles. If you add or remove users in the 
#"TestUsers@acme.com" group, the Zone Provisioning Agent will create or remove UNIX profiles for those users.
$zone = Get-CdmZone –Name “testzpa”
Set-CdmZpaSetting –UserEnabled $true -UserSource "TestUsers@acme.com" –Zone $zone
#----------------------------------------------------------------------------------------
#NAME:Set-CdmZone
#SYNOPSIS:Updates an existing zone.
# --------------------------  Update the parent zone for an existing zone  --------------------------
#This example gets the zone at “cn=Finance,cn=Zones,cn=Centrify,dc=acme,dc=com”, then sets its parent zone to “cn=global,cn=Zones,cn=Centrify,dc=acme,dc=com”.
Get-CdmZone –DN "cn=Finance,cn=Zones,cn=Centrify,dc=acme,dc=com" | Set-CdmZone –Parent "cn=global,cn=Zones,cn=Centrify,dc=acme,dc=com"
