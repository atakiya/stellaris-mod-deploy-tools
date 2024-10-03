@ECHO OFF

CALL "%~dp0\shared\common-vars.cmd"

MKLINK /D "%canonical_mod_path%" "%CD%"
COPY /Y "%mod_descriptor%" "%canonical_mod_path%.mod"
