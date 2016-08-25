echo off
REM ---------------------------------------------------
REM Auto generated from open_package_in_dymola.tt
REM ---------------------------------------------------
set MODELICAPATH=%MODELICAPATH%;"%~dp0\Libraries";
echo %MODELICAPATH%
if exist "C:\Program Files (x86)\Dymola 2015\bin64\Dymola.exe" (
    REM Dymola 2015
    "C:\Program Files (x86)\Dymola 2015\bin64\Dymola.exe" "%~dp0CyPhy\package.mo"
) else if exist "C:\Program Files (x86)\Dymola 2014\bin64\Dymola.exe" (
    REM Dymola 2014
    "C:\Program Files (x86)\Dymola 2014\bin64\Dymola.exe" "%~dp0\CyPhy\package.mo"
) else if exist "C:\Program Files (x86)\Dymola 2013\bin64\Dymola.exe" (
    REM Dymola 2013
    "C:\Program Files (x86)\Dymola 2013\bin64\Dymola.exe" "%~dp0\CyPhy\package.mo"
) else if exist "C:\Program Files (x86)\Dymola 2014 FD01\bin64\Dymola.exe" (
    REM Dymola 2014 FD01
    "C:\Program Files (x86)\Dymola 2014 FD01\bin64\Dymola.exe" "%~dp0\CyPhy\package.mo"
) else (
    echo Dymola 2014 and 2013 were not found!
    pause
)

