echo off
echo.
echo Checking up environment...
set QT_INSTALL_DIR=C:\app\Qt\Qt5.7.0-msvc2013\5.7\msvc2013
set QML_IMPORT_PATH=%QT_INSTALL_DIR%\qml
set PATH=%QT_INSTALL_DIR%\bin;%PATH%
cd /D %QT_INSTALL_DIR%

:Getting BAT run directory
cd /d %~dp0
set BAT_FILE_DIR=%cd%

echo.
set PLUGIN_NAME=Material
set PLUGIN_VER=0.3
echo Starting to generate qmltypes file for %PLUGIN_NAME%....

if "%1" == "h" goto begin 
mshta vbscript:createobject("wscript.shell").run("""%~fnx0"" h",0)(window.close)&&exit 
:begin

qmlplugindump -nonrelocatable %PLUGIN_NAME% %PLUGIN_VER% %QML_IMPORT_PATH%/%PLUGIN_NAME% > %QML_IMPORT_PATH%/%PLUGIN_NAME%/plugin.qmltypes
