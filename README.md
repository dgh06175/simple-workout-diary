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

## 캘린더 화면

<img src="https://github.com/dgh06175/simple-workout-diary/assets/77305722/9ac17087-9b2c-4dbe-b06a-132bd3d41eb0" width="20%" height="20%">

- 캘린더: 이번달의 캘린더가 보이고, 기록한 날짜는 색깔로 표시된다.
- 무게 증가한 날: 운동을 완료함으로써 무게 증량에 성공한 날은 불타는 GIF로 표시한다.
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


## 해야할 일
- [x] 캘린더에 데이터 연결하기
- [ ] 상세 운동 기록 화면 완성하기
    - [ ] 수정하기 기능
    - [x] 삭제하기 기능
- [ ] 모델에 운동 종목과 무게 기록 추가하기 (5X5 한정)
- [ ] 5x5 운동 루틴 추가하고 번갈아서 수행할 수 있도록 적용하기
- [ ] 운동 종목과 무게 기록도 CRUD 기능에 추가하기
- [ ] 한가지 운동의 5x5 세트를 모두 성공한 날은 다음 운동떄 무게 추가된다.
    - [ ] 또한 캘린더에서 불 표시가 된다.
- [ ] 운동 무게 기록 그래프 추가하기 (종목별)
