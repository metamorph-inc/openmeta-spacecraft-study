@echo off
setlocal EnableExtensions

if "%CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY%" == "" (
    echo CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY environment variable not set, using default: "C:\Program Files\Cameo Systems Modeler\"
    set CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY=C:\Program Files\Cameo Systems Modeler
)

setlocal enableDelayedExpansion
set csm_home_url_leader=!CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY: =%%20!
set csm_home_url_leader=!csm_home_url_leader:\=/!
set csm_home_url_leader=/!csm_home_url_leader!
set csm_home_url_base=!CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY::=%%3A!
set csm_home_url_base=!csm_home_url_base: =%%20!
set csm_home_url_base=!csm_home_url_base:/=%%2F!
set csm_home_url_base=!csm_home_url_base:\=%%5C!
setlocal disableDelayedExpansion
 
set csm_cp_url=file:%csm_home_url_leader%/bin/csm.properties?base=%csm_home_url_base%#CLASSPATH
 
for /F %%a in ('dir /b "%CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY%\lib\com.nomagic.osgi.launcher-*.jar"') do ^
set OSGI_LAUNCHER=%CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY%\lib\%%a
for /F %%a in ('dir /b "%CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY%\lib\bundles\org.eclipse.osgi_*.jar"') do ^
set OSGI_FRAMEWORK=%CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY%\lib\bundles\%%a
for /F %%a in ('dir /b "%CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY%\lib\bundles\com.nomagic.magicdraw.osgi.fragment_*.jar"') do ^
set MD_OSGI_FRAGMENT=%CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY%\lib\bundles\%%a
 
set CP=%OSGI_LAUNCHER%;^
%OSGI_FRAMEWORK%;^
%MD_OSGI_FRAGMENT%;^
%CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY%\lib\md_api.jar;^
%CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY%\lib\md_common_api.jar;^
%CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY%\lib\md.jar;^
%CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY%\lib\md_common.jar;^
%CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY%\lib\jna.jar

"%CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY%\jre\bin\java" -Xmx1200M -Xss1024K ^
     -Dmd.class.path=%csm_cp_url% ^
     -Dcom.nomagic.osgi.config.dir="%CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY%\configuration" ^
     -Desi.system.config="%CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY%\data\application.conf" ^
     -Dlogback.configurationFile="%CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY%\data\logback.xml" ^
     -cp "%CP%" ^
     -Dmd.plugins.dir="%CAMEO_SYSTEMS_MODELER_INSTALL_DIRECTORY%\plugins" ^
     -Dcom.nomagic.magicdraw.launcher=com.nomagic.magicdraw.commandline.CommandLineActionLauncher ^
     -Dcom.nomagic.magicdraw.commandline.action=com.metamorphsoftware.ImageExporterAction ^
     com.nomagic.osgi.launcher.ProductionFrameworkLauncher %*