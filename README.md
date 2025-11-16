<div align="center">
# 🎓 나만의 작은 교수님 [나작교]

**실시간 강의 인터렉션과 AI 기반 학습 지원을 제공하는 스마트 시간표 앱(유저)**

[유저 앱](https://github.com/2025-inthon-7/inthon-7-student)

[교수자 앱](https://github.com/2025-inthon-7/inthon-7-professor)

[백엔드](https://github.com/2025-inthon-7/inthon-7-backend)

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.9.2+-0175C2?logo=dart&logoColor=white)](https://dart.dev)

[주요 기능](#주요-기능) • [아키텍처](#아키텍처) • [프로젝트 구조](#프로젝트-구조) • [시작하기](#시작하기) • [팀원 소개](#팀원-소개)

</div>

## 주요 기능

- **실시간 통신**: WebSocket을 활용한 라이브 업데이트
- **인터랙티브 수업 관리**: 실시간 상호작용이 가능한 종합적인 교실 관리 기능
- **모던 UI**: Flutter Shadcn UI 디자인 시스템 적용
- **데이터 시각화**: FL Chart를 활용한 차트 및 분석 기능
- **이벤트 기반 캡처**: 중요한 ㅜ분만 캡처하여 기록
- **수업 Summary**: 교수도 

## 아키텍처


### 상태 관리
- **Riverpod**: NotifierProvider 패턴을 사용한 반응형 상태 관리
- **GetIt**: 의존성 주입을 위한 서비스 로케이터
- **Freezed**: copyWith 기능을 제공하는 불변 상태 클래스

### 네비게이션
- **GoRouter**: RouterService 싱글톤을 활용한 선언적 라우팅

### API 아키텍처 (3계층 패턴)
1. **UI 레이어**: BuildContext를 처리하는 위젯 코드
2. **로직 레이어**: Riverpod 프로바이더를 사용한 비즈니스 로직
3. **ApiService 레이어**: Result<T> 패턴을 사용한 서버 통신

### 프로젝트 구조
```
lib/
├── app/
│   ├── api/          # API 클라이언트, 인터셉터, 에러 핸들링
│   ├── auth/         # 인증 로직 및 상태
│   ├── extension/    # Dart 확장
│   ├── feature/      # 기능 모듈
│   │   ├── classroom/    # 수업 관리 기능
│   │   ├── error/        # 에러 처리 화면
│   │   └── home/         # 홈 화면 기능
│   ├── model/        # Freezed를 사용한 데이터 모델
│   ├── routing/      # GoRouter 설정
│   └── service/      # 핵심 서비스
├── main.dart         # 앱 진입점
└── service.dart      # 서비스 등록
```

## 시작하기

### 사전 요구사항
- Flutter SDK 3.9.2 이상
- Dart SDK 3.9.2 이상
- iOS/Android 개발 환경

### 설치 방법

1. **저장소 클론**
   ```bash
   git clone <repository-url>
   cd inthon-7-professor
   ```

2. **의존성 설치**
   ```bash
   flutter pub get
   ```

3. **환경 설정**

   루트 디렉토리에 `.env` 파일 생성:
   ```env
   API_ADDRESS=your_api_base_url
   ```

4. **코드 생성 실행**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **앱 실행**
   ```bash
   flutter run
   ```

## 개발 명령어

### 일반 작업
```bash
# 앱 실행
flutter run
```

### 코드 생성
이 프로젝트는 Freezed와 JSON 직렬화를 위한 코드 생성을 광범위하게 사용합니다:

```bash
# 전체 생성
dart run build_runner build

# 변경사항 감지
dart run build_runner watch

# 클린 후 재빌드
dart run build_runner build --delete-conflicting-outputs
```

다음 어노테이션을 수정한 후에는 코드 생성을 실행해야 합니다:
- `@freezed` 어노테이션
- `@JsonSerializable()` 어노테이션
- 기타 생성 어노테이션

## 주요 의존성

### 핵심
- **flutter_riverpod** (^2.6.1): 상태 관리
- **go_router** (^14.8.1): 네비게이션
- **get_it** (^8.0.3): 의존성 주입
- **freezed** (^2.5.7): 불변 데이터 클래스

### API 및 저장소
- **dio** (^5.8.0): HTTP 클라이언트
- **flutter_dotenv** (^5.2.1): 환경 설정
- **flutter_secure_storage** (^9.2.4): 보안 로컬 저장소
- **web_socket** (^1.0.1): 실시간 통신

### UI 및 UX
- **shadcn_ui** (^0.39.6): 디자인 시스템 컴포넌트
- **flutter_staggered_animations** (^1.1.1): 순차 애니메이션
- **animate_do** (^4.2.0): 사전 제작된 애니메이션
- **cached_network_image** (^3.4.1): 이미지 캐싱

### 데이터 시각화
- **fl_chart** (^1.1.1): 차트 및 그래프

## 디자인 시스템

이 프로젝트는 [Flutter Shadcn UI](https://flutter-shadcn-ui.mariuti.com/) 디자인 시스템을 사용합니다. 컴포넌트 사용 예시는 [shadcn_guide.md](shadcn_guide.md)를 참고하세요.

### 컴포넌트 예시
```dart
// 버튼
ShadButton(
  onPressed: () {},
  child: Text('클릭하세요'),
)

// 카드
ShadCard(
  title: Text('카드 제목'),
  description: Text('설명'),
  child: Text('내용'),
)

// 입력
ShadInput(
  placeholder: Text('텍스트 입력'),
  onChanged: (value) {},
)
```

## 코드 스타일 가이드

### 네이밍 규칙
- **파일명**: lowercase_with_underscores.dart
- **변수/함수**: camelCase
- **클래스**: PascalCase
- **상수**: UPPER_CASE

### 모범 사례

1. **BuildContext를 비즈니스 로직에 전달하지 않기**
   - UI와 로직 레이어를 분리하기
   - 에러 처리에는 Result 패턴 사용

2. **로직에서는 ref.read, 위젯에서는 ref.watch 사용**
   - ref.watch: 반응형 리빌드용
   - ref.read: 일회성 읽기 및 이벤트 핸들러용

3. **리소스 항상 해제하기**
   - 컨트롤러(Animation, Text, Scroll)
   - FocusNode, StreamSubscription
   - 메모리 누수 방지

4. **반응형 레이아웃**
   - 고정 크기 피하기
   - MediaQuery, Expanded, Flexible 사용
   - 제약사항은 LayoutBuilder 사용

5. **코드 구성**
   - 파일당 150줄 이하 유지
   - 위젯을 별도 파일로 분리
   - 깊은 위젯 중첩 피하기

## 환경 변수

앱은 `.env`에 저장된 환경 변수를 사용합니다:

- `API_ADDRESS`: API 엔드포인트의 베이스 URL

환경 변수는 `Service.initEnv()`에서 `flutter_dotenv`를 통해 로드됩니다.

## 서비스

앱은 다음 싱글톤 서비스들을 사용합니다 (`ClassName.I`로 접근):

- **ApiService**: API 호출 및 서버 통신
- **AuthService**: 인증 및 토큰 관리
- **SecureStorageService**: 보안 로컬 데이터 저장소
- **RouterService**: 네비게이션 및 라우팅



<div align="center">

## 팀원 소개

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/25a80d8b-c81c-4889-ac1d-18981739e84a" width="30" height="30" alt="민준"> <strong>김민준(팀원)</strong></td>
    <td>Flutter 앱 개발 - 교수자용</td>
  </tr>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/223916777?s=96&v=4" width="30" height="30" alt="연오"> <strong>고연오(팀원)</strong></td>
    <td>Flutter 앱 개발 - 학생용</td>
  </tr>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/165269047?s=96&v=4" width="30" height="30" alt="한성"> <strong>김한성(팀장)</strong></td>
    <td>Django 서버 개발/배포, Flutter 앱 개발 - 학생용</td>
  </tr>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/133748406?s=96&v=4" width="30" height="30" alt="성진"> <strong>임성진(팀원)</strong></td>
    <td>Django 서버 개발, AI 개발, 프롬프팅</td>
  </tr>
</table>

**Made with ❤️ by INTHON 7 Team**

</div>

