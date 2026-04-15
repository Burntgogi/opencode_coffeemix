# 릴리스 노트

**언어:** [English](./RELEASE_NOTES.md) | 한국어

## 2026-04-15

### 주요 변경

- `coffeemix_all`을 **OpenCode + OMO용 설치형 CoffeeMix 확장 팩**으로 다시 정의했습니다.
- 영어/한글 README에 sweet-themed CoffeeMix SVG 이미지를 추가했습니다.
- 설치 및 검증 가이드를 보강해 설정과 인수인계 흐름을 더 명확하게 만들었습니다.

### 사용자 관점 변경

- README 첫 소개 문구를 standalone workspace가 아니라 **확장 팩**에 맞게 수정했습니다.
- `README.md`, `README.ko.md` 상단에 CoffeeMix 브랜딩 이미지를 추가했습니다.
- 설치 가이드에서 다음 내용을 더 분명히 설명했습니다:
  - `YOUR_PROVIDER/YOUR_MODEL` placeholder가 남아 있을 때의 의미
  - `oh-my-opencode.json`의 merge source/template 성격
  - `reports/`가 gitignored/generated output이라는 점

### 기술 변경

- `tools/harness.py`의 OpenCode 바이너리 탐색 순서를 개선했습니다:
  - `OPENCODE_BIN`
  - 시스템 `PATH`
  - 공통 fallback 경로
- OpenCode 미설치 환경에서도 validation runner가 예외로 죽지 않고 구조화된 실패를 반환하도록 정리했습니다.
- 검증 러너명 관련 stale reference를 workspace naming 기준으로 정리했습니다.
- public README 구조 표에서 stale한 `archive/` 항목을 제거했습니다.

### 검증

- `python -m py_compile tools/harness.py`
- `tools/harness.py` 대상 `lsp_diagnostics`
- README / installation guide / config wording / 자산 배치 확인

### 참고

- 병합 전 상태를 보존하는 임시 백업 브랜치를 유지 중입니다:
  - `backup/master-20260415-pre-coffeemix-update`
- 문제 없이 안정화되면 추후 정리 가능합니다.
