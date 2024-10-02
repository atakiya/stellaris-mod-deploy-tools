@ECHO OFF

SET mod_descriptor=%CD%\descriptor.mod
FOR /F "tokens=*" %%G IN (
	'FINDSTR /R "^path" %mod_descriptor%' ) DO (SET mod_name=%%G)
FOR /F "tokens=2 delims==" %%G IN ( "%mod_name%" ) DO (SET mod_name=%%G)
FOR /F "tokens=2 delims=/" %%G IN ( "%mod_name%" ) DO (SET mod_name=%%G)
SET mod_name=%mod_name:"=%

FOR /F "tokens=3" %%G IN (
	'REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal"'
	) DO (SET user_data_home=%%G)

SET mods_directory=%user_data_home%\Paradox Interactive\Stellaris\mod\
SET canonical_mod_path=%mods_directory%\%mod_name%

ECHO Using internal name: %mod_name%
