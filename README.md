
This is a batch file I use to check the availability of updates for the applications I installed on Windows. Since the basic concept is the same for all applications, I have only included the code that deals with one of them, which happens to be VirtualBox.

The first for loop fetches the version number of the installed application. The nested for loop removes the unnecessary part of the version number.

The third for loop fetches the webpage where the software versions are listed, plucks out the relevant line, and extracts the number of the current version.

The if statement compares the two version numbers and notifies the user if there's a more recent version.

Notes:
_To make for a better user experience, I turned echo off and made curl silent.
_For debugging purposes, the version numbers for both installed and website versions are echoed out after they're determined.
