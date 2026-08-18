@echo off

echo =========================================
echo LIMPIANDO REPORTES
echo =========================================

rmdir /S /Q allure-results
rmdir /S /Q allure-report

echo =========================================
echo Generar transacciones
echo =========================================

REM B2B DESHABILITADO
REM call newman run Transferencias_V2_B2B_Codigo_200_Cuentas.json -d codigos_200_B2B.csv -e environment.json -r allure --delay-request 3000
REM call newman run Transferencias_V2_B2P_Codigo_200_Cuentas.json -d codigos_200_B2P.csv -e environment.json -r allure --delay-request 3000
REM call newman run Transferencias_V2_P2B_Codigo_200_Cuentas.json -d codigos_200_P2B.csv -e environment.json -r allure --delay-request 3000
REM B2P ACTIVO

call newman run Transferencias_V2_P2P_Codigo_200_Cuentas.json -d codigos_200_P2P.csv -e environment.json -r allure --delay-request 3000

echo =========================================
echo GENERANDO ALLURE
echo =========================================

call allure generate --single-file allure-results --clean -o allure-report

echo =========================================
echo REPORTE GENERADO
echo =========================================

pause