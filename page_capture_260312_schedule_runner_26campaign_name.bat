
@echo off

chcp 65001 > nul

REM Python 경로 및 스크립트 경로 지정

SET PYTHON_PATH="C:\Users\user_name\AppData\Local\Programs\Python\Python312\python.exe"
SET SCRIPT_PATH="C:\Users\user_name\OneDrive - company_name\user_id\2.data\99.PY,SQL-250429\00.py_notebook\251002_page_capture\page_capture_251013_260312_26CAMPAIGN_NAME.py"

echo [INFO] 스크립트 실행 시작:
%PYTHON_PATH% %SCRIPT_PATH%
echo [INFO] 스크립트 실행 완료
