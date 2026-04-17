# page_capture

Selenium 기반 웹 페이지 전체 캡처 자동화 도구입니다.  
PC / MO(모바일) 뷰를 각각 캡처하여 지정 폴더에 PNG 및 MHTML로 저장합니다.

## 파일 구성

| 파일 | 설명 |
|---|---|
| `page_capture_260417_260417_new.py` | 메인 캡처 스크립트 v2 (에러 페이지 감지 + MHTML 저장 추가) |
| `page_capture_251013_260312_26CAMPAIGN_NAME.py` | 메인 캡처 스크립트 v1 |
| `foldering_move_png_251126_26campaign_name.py` | 캡처된 PNG를 사이트코드별 하위 폴더로 정리 |

## 변경 이력

### 2026-04-17 (v2 `page_capture_260417_260417_new.py`)
- **에러 페이지 감지 추가**: `driver.title` 기반으로 404 / 502 / Samsung error 페이지 사전 감지 → PNG/MHTML 저장 스킵
  - 감지 키워드: `error`, `404`, `502`, `503`, `bad gateway`, `page not found`, `not available`
  - Samsung 에러 페이지 예시: `<title>error | Samsung Gulf</title>`
  - skip된 URL은 `skipped_error_page_MMDD_HHMM.txt`로 별도 저장
- **리다이렉트 skip URL**도 `skipped_redirect_MMDD_HHMM.txt`로 저장 (기존)
- MHTML 저장 지원 (기존)

## 사용 방법

### 1. URL 목록 수정
스크립트 하단 `urls` 변수에 캡처할 URL을 입력합니다.

### 2. 출력 경로 수정
`OUTPUT_DIR` 및 `filename` 경로를 로컬 환경에 맞게 수정합니다.

```python
OUTPUT_DIR = "C:/Users/user_name/Downloads/md_png"
```

### 3. 직접 실행

```bash
python page_capture_260417_260417_new.py
```

### 4. 작업 스케줄러 등록 (창 없이 백그라운드 실행)

> 💡 **`pythonw.exe` 사용 권장**  
> `python.exe`는 실행 시 cmd 창이 팝업됩니다.  
> 같은 경로의 `pythonw.exe`를 사용하면 창이 전혀 뜨지 않습니다.

#### CLI 등록

```bat
schtasks /create /tn page_capture ^
  /tr "\"C:\Python3xx\pythonw.exe\" \"C:\Users\user_name\...\page_capture_260417_260417_new.py\"" ^
  /sc daily /st 09:00 /it /f
```

#### GUI 등록

1. `taskschd.msc` 실행
2. **작업 만들기** → 일반 탭: 이름 입력, "사용자가 로그온할 때만 실행" 선택
3. **트리거** 탭 → 새로 만들기 → 반복 주기 설정
4. **동작** 탭 → 새로 만들기:
   - 프로그램/스크립트: `C:\Python3xx\pythonw.exe` (창 없이 실행; 일반 python.exe 쓰면 cmd 창 팝업됨)
   - 인수 추가: `"C:\Users\user_name\OneDrive - company_name\...\page_capture_260417_260417_new.py"`
5. **조건** 탭 → 전원 섹션 → **"AC 전원이 연결된 경우에만 작업 시작" 체크 해제**

### 5. PNG 정리
캡처 완료 후 `foldering_move_png_251126_26campaign_name.py`를 실행하면  
사이트코드별 하위 폴더로 자동 분류됩니다.

## 요구사항

```
selenium
Pillow
numpy
```

ChromeDriver가 설치되어 있어야 합니다.
