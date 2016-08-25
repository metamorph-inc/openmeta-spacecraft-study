echo off
REM ---------------------------------------------------
REM Auto generated from open_package_in_om.tt
REM ---------------------------------------------------

if "%OPENMODELICAHOME%" == "" (
    echo OPENMODELICAHOME evironment not found, OpenModelica is probably not installed.
    pause
) else if exist %OPENMODELICAHOME% (
    REM OpenModelica found
    set OPENMODELICALIBRARY=%OPENMODELICALIBRARY%;"%~dp0\Libraries";
    echo %OPENMODELICALIBRARY%
    %OPENMODELICAHOME%\bin\OMEdit.exe "%~dp0\CyPhy\package.mo"
) else (
    echo %OPENMODELICAHOME% not found, OpenModelica probably not installed.
    pause
)
