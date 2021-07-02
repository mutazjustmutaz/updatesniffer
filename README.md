
  These are Windows shell scripts I use to check the availability of updates for the applications installed on the operating system. One of them is a batch file for the command shell while the other is for the PowerShell. They both serve the same purpose.
  Since the basic concept is the same for all applications, I have included the code that deals with only one of them (VirtualBox) as an example.
  For debugging purposes, the version numbers for both installed and website versions are echoed out right after they're determined.

NOTES:
updatesniffer.bat: To make for a better user experience, I turned echo off and made curl silent.

updatesniffer.ps1: There are 2 ways to retrieve data about installed software, the first is to request data about the applications that were installed using a Windows installer while the second is to request data about the applications that registered an uninstaller. The installer method has 2 problems: 
1-It doesn't guarantee that all applications will be included, because there may be applications that weren't installed using a Windows installer.
2-It's slow.
Consequently, I used the uninstaller method.
