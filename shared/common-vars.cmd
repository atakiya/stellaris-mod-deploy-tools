@ECHO OFF

SET mod_descriptor=%CD%\descriptor.mod
REM Get the 'path=' line from the descriptor.mod file
FOR /F "tokens=*" %%G IN (
	'FINDSTR /R "^path" %mod_descriptor%' ) DO (SET mod_name=%%G)
REM Trim the 'path=' part
FOR /F "tokens=2 delims==" %%G IN ( "%mod_name%" ) DO (SET mod_name=%%G)
REM Trim quotes
SET mod_name=%mod_name:"=%
REM Get the basename of the path (delimit by /)
FOR /F "delims=" %%G IN ( "%mod_name%" ) DO (SET mod_name=%%~nG)

REM Get the user's data directory (Documents)
FOR /F "tokens=3" %%G IN (
	'REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal"'
	) DO (SET user_data_home=%%G)

SET mods_directory=%user_data_home%\Paradox Interactive\Stellaris\mod\
SET canonical_mod_path=%mods_directory%\%mod_name%

ECHO Using internal name: %mod_name%
