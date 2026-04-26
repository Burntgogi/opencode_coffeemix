# coffeemix_all 0.2

<div align="center">

<img src="./assets/coffeemix-all-title.png" alt="coffeemix_all — 에이전트를 위한 달콤한 커피 한잔" width="920" />

**에이전트를 위한 달콤한 커피 한잔.**

**언어:** [English](./README.md) | 한국어

</div>

---

coffeemix_all은 OpenCode + OMO에 설치하는 CoffeeMix 확장 팩으로, 전문 에이전트, 로컬 스킬, 검증 도구, 설치 가이드를 함께 제공합니다.

## 필수 요구사항

coffeemix_all을 사용하려면 다음 두 프로그램이 시스템에 설치되어 있어야 합니다:

| 프로그램 | 설명 | 설치 방법 |
|---------|------|---------|
| [OpenCode](https://github.com/opencode-ai/opencode) | 터미널 기반 AI 코딩 에이전트 | `npm install -g opencode-ai` |
| [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) | OpenCode 플러그인 — 다중 에이전트 오케스트레이션 | `npm install -g oh-my-opencode` |

두 프로그램 설치 후 `bunx oh-my-opencode install`을 실행하여 모델 provider를 설정하세요.

## 빠른 시작

현재 상태에 맞는 경로를 선택하세요:

- **처음 설치:** 아래 기본 설치 경로를 사용하세요. 기본 설치는 additive이며 기존 파일을 덮어쓰지 않고 건너뜁니다.
- **CoffeeMix 0.1에서 0.2로 업데이트:** 기본 설치에 의존하지 마세요. [`docs/UPDATE.md`](./docs/UPDATE.md)의 명시적 CoffeeMix 소유 update mode를 사용하세요.

기본 설치 경로는 OMO / oh-my-openagent를 control plane으로 유지합니다. 기존 OMO routing, model, skill, provider 설정을 대체하지 않습니다.

```powershell
# 패키지를 클론 또는 다운로드한 후:
cd opencode_coffeemix_all_0_2
.\install-global.ps1 -WhatIf
```

실제 설치 전에는 반드시 `-WhatIf` 출력을 확인하고 전역 OpenCode config를 백업하세요.

자세한 설치 방법은 [`docs/installation-guide.md`](./docs/installation-guide.md)를 참조하세요. 0.1에서 0.2로 업데이트하는 경우 [`docs/UPDATE.md`](./docs/UPDATE.md)를 먼저 읽으세요.

### CoffeeMix 0.1에서 업데이트

CoffeeMix 0.2 installer 작업은 명시적 update flag를 기준으로 설계됩니다:

```powershell
$backup = "$env:USERPROFILE\.config\opencode-backups\coffeemix-0-1-before-0-2"
.\install-global.ps1 -WhatIf -UpdateCoffeeMix -BackupDir $backup
.\install-global.ps1 -UpdateCoffeeMix -BackupDir $backup
```

로컬 `install-global.ps1`에 `-UpdateCoffeeMix`와 `-BackupDir`가 없다면 중지하세요. 기본 설치는 fresh additive install에만 사용하세요. 일반 설치는 기존 CoffeeMix 파일을 건너뛰므로 0.1 agents, skills, plugin 파일이 그대로 남을 수 있습니다.

업데이트 리허설에는 `-WhatIf -ConfigDir <mock OpenCode config>`를 사용하세요. mock directory에는 `oh-my-opencode.json` 또는 `oh-my-openagent.json` 같은 OMO config가 있어야 합니다. 업데이트 가이드에는 backup, rollback, post-update validation commands가 포함되어 있습니다.

## coffeemix_all이란?

coffeemix_all은 다음을 제공합니다:

- **14개 `gb-*` 전문 에이전트** — 리뷰, 디버깅, 계획, 진단, 상태 확인, 인수인계 등 특화된 작업을 담당하는 에이전트
- **8개 로컬 스킬** — 계획, 디버깅, 검증, 도입 심사를 위한 재사용 가능한 워크플로우 게이트
- **검증 하니스** — 작업 행동과 전문 에이전트 라우팅을 시나리오 기반으로 테스트
- **전역 설치 스크립트** — OMO/OpenAgent config 감지, `-WhatIf`, `-ConfigDir`, plugin skip, preview mode JSON write 보호를 갖춘 PowerShell merge installer. fresh install은 additive이며 기존 파일을 건너뜁니다. 0.1 사용자는 명시적 CoffeeMix 소유 update mode가 필요합니다.
- **UI 배지 플러그인** — OpenCode TUI 환경을 위한 CoffeeMix 표시
- **배포용 문서** — 설치 가이드와 릴리스 노트 중심의 간결한 문서

## 0.2 업데이트

- OMO / oh-my-openagent를 control plane으로 유지하는 CoffeeMix-first `gb-*` overlay
- `-ConfigDir` 기반 mock config 검증과 명시적 0.1 to 0.2 update path를 설명하는 더 안전한 global installer guidance
- `SKILL.md`가 포함된 local skill 문서화
- CoffeeMix UI badge plugin 기본 포함
- 배포 필수 문서 중심으로 `/docs` 정리
- 명시적 비목표: OMO replacement, copied router/model/loader, 기본 GBrain/browser/checkpoint/design runtime, `gb-*` 삭제 없음

## 구조

| 경로 | 용도 |
|------|------|
| `.opencode/agents/` | 14개 `gb-*` 전문 에이전트 프롬프트 |
| `.opencode/skills/` | `SKILL.md` 문서가 포함된 8개 로컬 워크플로우 스킬 |
| `.opencode/plugins/` | UI 배지 플러그인 |
| `assets/` | 로고와 시각 자료 |
| `docs/` | 설치 가이드, [업데이트 가이드](./docs/UPDATE.md), [릴리스 노트](./docs/RELEASE_NOTES.ko.md) |
| `scenarios/` | 작업 기반 행동 시나리오 |
| `routing-scenarios/` | ID-프롬프트 라우팅 검증 |
| `tools/` | 검증 하니스 및 러너 |

## 스킬

| 스킬 | 용도 |
|------|------|
| `ask-user-question` | 되돌릴 수 없는 작업 전에 명시적 사용자 확인 요구 |
| `compact-context` | 긴 세션의 핵심 정보를 유지하며 요약 |
| `enter-plan-mode` | 중요 구현 전 계획 모드로 전환 |
| `integration-intake` | 외부 워크플로우/도구 도입 심사 게이트 |
| `systematic-debugging` | 증상 추측이 아닌 근본 원인 기반 디버깅 |
| `test-driven-development` | 변경 전 실패하는 테스트 또는 수용 기준 정의 |
| `tool-search` | 작업 맥락에 맞는 도구 자동 발견 및 선택 |
| `verification-before-completion` | 완료 선언 전 신선한 증거 요구 |

## 전문 에이전트 목록

| 에이전트 | 역할 |
|---------|------|
| `gb-commit` | git 커밋 워크플로우 — Conventional Commits, 원자적 커밋 |
| `gb-review` | 코드 리뷰 — 정확성, 보안, 아키텍처, 유지보수성 |
| `gb-debug` | 버그 조사 — 근본 원인 추적, 증거 기반 디버깅 |
| `gb-ultraplan` | 심층 아키텍처 계획 — 대규모 리팩토링, 시스템 설계 |
| `gb-doctor` | 시스템 진단 — 프로젝트 건강 상태, 설정 문제 진단 |
| `gb-compact` | 컨텍스트 압축 — 긴 세션 요약, 핵심 정보 보존 |
| `gb-resume` | 세션 재개 — 중단된 작업 분석, 계속 계획 수립 |
| `gb-share` | 세션 내보내기 — 인수인계용 요약 생성 |
| `gb-statusline` | 상태 표시 — 활성 설정, 작업 컨텍스트 개요 |
| `gb-teleport` | 컨텍스트 전환 — 브랜치, worktree, 세션 간 안전한 이동 |
| `gb-worktree` | git worktree 관리 — 병렬 브랜치 작업 |
| `gb-config` | 설정 검사 — 설정 충돌, 위험 설정 식별 |
| `gb-memory` | 세션 메모리 — 세션 간 지속되어야 할 컨텍스트 추출 |
| `gb-plugin` | 플러그인 관리 — 발견, 평가, 설치, 충돌 진단 |

## 검증

검증 하니스를 실행하여 전문 에이전트 라우팅과 시나리오 동작을 확인하세요:

```bash
# 스모크 체크
python tools/workspace_smoke_runner.py

# 전체 e2e 검증
python tools/workspace_e2e_runner.py

# 라우팅 검증
python tools/routing_validation_runner.py
```

리포트는 `reports/`에 저장됩니다. 배포 산출물에는 포함하지 마세요.

## 감사의 말

이 프로젝트는 AI 에이전트 생태계의 다른 작업물들을 기반으로 합니다:

- **[OpenCode](https://github.com/opencode-ai/opencode)** — 터미널 기반 AI 코딩 에이전트 런타임
- **[oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent)** — 오케스트레이션 레이어와 baseline control plane
- **[obra/superpowers](https://github.com/obra/superpowers)** — workflow discipline과 skill-authoring 영향
- **[garrytan/gstack](https://github.com/garrytan/gstack)** — specialist layering과 optional adapter 영감

## 구성 요소 출처

| 접두사 / 소스 | 출처 |
|---------------|------|
| `gb-*` 전문 에이전트 | coffeemix_all 오리지널 ("gb" = 가베, 한국어 'coffee'의 옛말) |
| 로컬 디서플린 스킬 | [obra/superpowers](https://github.com/obra/superpowers)의 workflow gate 개념에서 차용 |
| `integration-intake` | CoffeeMix 통합 심사를 위한 게이트 |
| 기본 에이전트 (`sisyphus`, `oracle`, `librarian` 등) | [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) 제공 |

이 저장소의 모든 전문 에이전트 프롬프트, 로컬 스킬, 검증 스크립트, 라우팅 시나리오는 독립적으로 작성된 workspace 로컬 산출물입니다.

## 라이선스

이 프로젝트는 MIT 라이선스를 따릅니다 — 자세한 내용은 [LICENSE](./LICENSE)를 참조하세요.
