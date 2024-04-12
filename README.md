# Simple Workout Diary

날짜별로 운동 기록을 간편하게 기록할 수 있는 앱

- 날짜별로 운동 기록을 간편하게 할 수 있다.
- 짧은 글로 그 날의 운동이 어땠는지 메모 가능하다.
- 기록한 내용을 되돌아 볼 수 있고 수정, 삭제도 물론 가능하다.

# 화면 기능 정의

## 홈 화면

<img src="https://github.com/dgh06175/simple-workout-diary/assets/77305722/c5445dc0-609a-40af-95bf-7c55ab81f5fa" width="20%" height="20%">

- 기록하기: 오늘의 운동을 기록하는 화면으로 이동한다.

## 기록하기 화면

<img src="https://github.com/dgh06175/simple-workout-diary/assets/77305722/140e85be-79d4-43bd-b572-b914acb51ce6" width="20%" height="20%">

- 운동 기록: 어떤 운동을 어떤 무게로 몇 번 몇 세트 수행했는지 기록한다.
- 메모: 오늘 운동이 어땠는지 간단하게 메모할 수 있다.
- 사진: 사진 한 장을 기록할 수 있다. - 추후 개발

## 캘린더 화면

<img src="https://github.com/dgh06175/simple-workout-diary/assets/77305722/9ac17087-9b2c-4dbe-b06a-132bd3d41eb0" width="20%" height="20%">

- 캘린더: 이번달의 캘린더가 보이고, 기록한 날짜는 색깔로 표시된다.
- 운동 기록 상세: 기록한 날짜를 누르면 그 날의 운동 기록 화면으로 이동한다.

## 운동 기록 상세 화면

<img src="https://github.com/dgh06175/simple-workout-diary/assets/77305722/24417f39-4bf9-44e4-a193-2da553ed3ca0" width="20%" height="20%">

- 해당 날짜가 표시된다.
- 어떤 운동을 어떻게 수행했는지 간단하게 표시된다. (총 운동 볼륨, 총 세트 수)
- 그날에 작성한 간단한 메모가 표시된다.
- 수정하기 버튼을 누르면 기록화기 화면과 동일한 화면이 보이고 기록을 수정할 수 있다.

## 운동 기록 그래프 화면

- 사용자가 수행했던 운동을 고를 수 있다.
- 운동 종목을 선택하면 해당 운동에 대한 무게 그래프가 표시된다.
- 무게 기준은 1RM으로 치환하여 계산한다.


# 메모 데이터 정의

> WorkoutDetailRecord

- 작성 날짜: Date
- 운동 정보: [WorkoutDetail]
    - 운동 종류: WorkoutType(Enum)
    - 몇킬로 몇개 몇번 했는지: [WorkoutSet]
        - 무게, 개수 (Double, Int)
- 메모: String
- 기분 이모지: WorkoutFeeling(Enum)
