@ECHO OFF
::====================================
SET GITHUB_ACCOUNT=parat482
SET WS_DIR=workspace
SET REPO_NAME=Title_Validation_full
SET APP_VERSION=1.1
SET MAIN_CLASS=core.Selenium
SET ARGS_01=
::====================================
IF "%JAVA_HOME%" == "" GOTO EXIT_JAVA
ECHO Java Installed
IF "%M2%" == "" GOTO EXIT_MVN
ECHO Maven Installed
CALL git --version > nul 2>&1
IF NOT %ERRORLEVEL% == 0 GOTO EXIT_GIT
ECHO Git Installed

GOTO NEXT

:NEXT
IF NOT EXIST C:\%WS_DIR% GOTO NO_WORKSPACE
IF EXIST C:\%WS_DIR%\%REPO_NAME% RMDIR /S /Q C:\JAVA\%WS_DIR%\%REPO_NAME%
CD C:\%WS_DIR%
git clone https://github.com/parat482/Title_Validation_full.git
CD %REPO_NAME%
SLEEP 2
CALL mvn clean site test -Dtest=AllTests -Dbuild.version="1.1"
ECHO.
ECHO Executing Java programm ...
java -jar ./target/%REPO_NAME%-%APP_VERSION%-jar-with-dependencies.jar
GOTO END

:EXIT_JAVA
ECHO No Java installed
GOTO END
:EXIT_MVN
ECHO No Maven installed
GOTO END
:EXIT_GIT
ECHO No Git installed
GOTO END
:NO_WORKSPACE
ECHO %WS_DIR% is not installed
GOTO END
:END
CD\ 
