@echo OFF
setlocal

set "searchstartHash=startHash"
FOR /F "tokens=*" %%g IN ('git rev-parse Head') do (SET insertsartHash=%%g)

set "textFile=F:\AutomatedDeployment-DO_NOT_DELETE\ADMPatch\automated-package-manager-(avm)\version-manager.properties"

(FOR /f "usebackq tokens=1* delims==" %%i in ("%textFile%") do (
   if "%%i" equ "%searchstartHash%" (
      echo %searchstartHash%=%insertsartHash%
   ) else if "%%j" neq "" (
      echo %%i=%%j
   ) else (
      echo %%i
   )
)) > temp.tmp

move /Y temp.tmp "%textFile%"