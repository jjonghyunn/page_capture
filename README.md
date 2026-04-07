# page_capture

Selenium 기반 웹 페이지 전체 캡처 자동화 도구입니다.  
PC / MO(모바일) 뷰를 각각 캡처하여 지정 폴더에 PNG로 저장합니다.

## 파일 구성

| 파일 | 설명 |
|---|---|
| `page_capture_251013_260312_26CAMPAIGN_NAME.py` | 메인 캡처 스크립트 (URL 목록 → PNG 저장) |
| `page_capture_260312_schedule_runner_26campaign_name.bat` | 작업 스케줄러 실행용 배치 파일 |
| `foldering_move_png_251126_26campaign_name.py` | 캡처된 PNG를 사이트코드별 하위 폴더로 정리 |

## 사용 방법

### 1. 경로 설정
`page_capture_260312_schedule_runner_26campaign_name.bat` 내 `PYTHON_PATH`, `SCRIPT_PATH`를 로컬 환경에 맞게 수정합니다.

### 2. URL 목록 수정
`page_capture_251013_260312_26CAMPAIGN_NAME.py` 하단 `urls` 변수에 캡처할 URL을 입력합니다.

### 3. 실행
배치 파일을 직접 실행하거나, Windows 작업 스케줄러에 등록합니다.

### 4. PNG 정리
캡처 완료 후 `foldering_move_png_251126_26campaign_name.py`를 실행하면  
사이트코드별 하위 폴더로 자동 분류됩니다.

## 요구사항

```
selenium
Pillow
numpy
```

ChromeDriver가 설치되어 있어야 합니다.
