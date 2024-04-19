# 🏋️‍♀️ Simple Workout Diary

iOS 17.2 / SwiftUI / SwiftData

![simpleworkoutdiary](https://github.com/dgh06175/simple-workout-diary/assets/77305722/afc9b20a-311e-4391-b13e-a282b577b698)

날짜별로 운동 기록을 간편하게 기록할 수 있는 앱

- 날짜별로 운동 무게 기록을 간편하게 할 수 있다.
- 그 날의 운동이 어땠는지 메모할 수 있다.
- 기록한 내용을 되돌아 볼 수 있다.

# 🎥 작동 영상 (Youtube)

[![ChatBot](https://img.youtube.com/vi/qUdbFK_AfPw/0.jpg)](https://www.youtube.com/watch?v=qUdbFK_AfPw)

# 👤 유저 플로우

![simpleworkoutdiary_userflow](https://github.com/dgh06175/simple-workout-diary/assets/77305722/ac79c352-4ced-40d7-aa6f-b5ab44508246)

# 💻 화면 기능 정의

## 🏠 홈 화면

<img src="https://github.com/dgh06175/simple-workout-diary/assets/77305722/9a2bc6e8-b4a1-4da2-a8d1-6147216bfa43" width="40%" height="40%">

- 기록하기: 오늘의 운동을 기록하는 화면으로 이동한다.

## 📝 기록하기 화면

<img src="https://github.com/dgh06175/simple-workout-diary/assets/77305722/49849016-da74-41b3-8d49-2fb5ae0c4a83" width="40%" height="40%">

- 운동 기록: 어떤 운동을 어떤 무게로 몇 번 몇 세트 수행했는지 기록한다.
- 메모: 오늘 운동이 어땠는지 간단하게 메모할 수 있다.
- 기분: 완료 버튼을 누른 다음, 그날의 운동 기분을 선택하면 기록이 저장된다.

## 📅 캘린더 화면

<img src="https://github.com/dgh06175/simple-workout-diary/assets/77305722/498368cc-9b21-4f20-a9b8-4e3e61992c7d" width="40%" height="40%">

- 캘린더: 이번달의 캘린더가 보이고, 기록한 날짜는 색깔로 표시된다.
- 무게 증가한 날: 운동을 완료함으로써 무게 증량에 성공한 날은 불타는 GIF로 표시한다.
- 운동 약: 운동한 날의 날짜를 클릭하면 하단에 해당 날짜의 운동 기록이 보인다. 클릭하면 운동 기록 상세 화면으로 이동한다.

## 🏃‍♂️ 운동 기록 상세 화면

<img src="https://github.com/dgh06175/simple-workout-diary/assets/77305722/3386cc98-cdc4-46a9-b15d-13167b8112f9" width="40%" height="40%">

- 해당 날짜가 표시된다.
- 어떤 운동을 어떻게 수행했는지 간단하게 표시된다. (총 운동 볼륨, 총 세트 수)
- 그날에 작성한 간단한 메모가 표시된다.
- 수정하기 버튼을 누르면 기록화기 화면과 동일한 화면이 보이고 기록을 수정할 수 있다.

## 📈 운동 기록 그래프 화면

<img src="https://github.com/dgh06175/simple-workout-diary/assets/77305722/e8885e06-65f0-4d20-9ec1-e4a16074cc6d" width="40%" height="40%">

- 사용자가 수행했던 운동을 고를 수 있다.
- 운동 종목을 선택하면 해당 운동에 대한 무게 그래프가 표시된다.

# 💽 메모 데이터 정의

> **WorkoutDetailRecord**

- 작성 날짜: `Date`
- 메모: `String`
- 운동 상세 정보: `[WorkoutDetail]`
- 기분 이모지: `WorkoutFeeling`(Enum)

> **WorkoutDetailRecord**

- 운동 종류: `WorkoutType`(Enum)
- 무게: `Int`

## ✅ 체크리스트
- [x]  캘린더에 데이터 연결하기
- [x]  상세 운동 기록 화면 완성하기
    - [x]  수정하기 기능
    - [x]  삭제하기 기능
- [x]  모델에 운동 종목과 무게 기록 추가하기 (5X5 한정)
- [ ]  5x5 운동 루틴 추가하고 번갈아서 수행할 수 있도록 적용하기
- [x]  운동 종목과 무게 기록도 CRUD 기능 추가하기
- [ ]  한가지 운동의 5x5 세트를 모두 성공한 날은 다음 운동떄 무게 추가된다.
    - [x]  또한 캘린더에서 불 표시가 된다.
- [x]  운동 무게 기록 그래프 추가하기 (종목별)
- [x]  당일에 운동 기록이 있으면 기록 생성 시 덮어쓸것이냐고 수정 가능하다고 물어보고 저장시에 덮어쓰기
    -> 하루에 여러번 운동 가능하도록 함

## ↩️ 백로그

- [ ] SwiftData 과 어울리게 코드 짜는 법 학습
- [ ] HIG 학습
- [ ] 디테일한 SwiftUI 컴포넌트 사용법 익히기
