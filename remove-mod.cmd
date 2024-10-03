@ECHO OFF

CALL "%~dp0\shared\common-vars.cmd"

RMDIR "%canonical_mod_path%"
DEL /F "%canonical_mod_path%.mod"
