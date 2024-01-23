# demo-repository
해당 repository는 Git에 익숙해지기 위해 연습용으로 만들었습니다. 우리가 실제로 개발할 repository가 정확히 이 repository의 설정과 동일하게 가져가려 합니다. 즉, 아래 설명을 참고하여 사용법을 익히고 이것저것 해 보길 바랍니다. 실제 프로젝트 repository가 생성되면 여기 아래 있는 것들 다 할 줄 안다고 생각하고 그냥 진행할겁니다.

목차는 아래와 같이 되어있습니다.
1. 패키지 구조화
2. **각자 해야할 일** (핵심!)
3. 사용 시 주의할점
4. 기타

# 1. 패키지 구조화
naming은 협업에서 꽤 중요합니다. 개인적으로 코드를 작성하고 프로젝트를 구성할 때와는 달리 여러 사람이 같이 작업하기 때문입니다. 여기서는 총 2가지 case에 대해 이야기 할 생각입니다. Folder Naming과 Code Naming 입니다.

ROS2를 사용하는 프로젝트의 경우 보통 아래와 같은 폴더 조직을 가집니다.(우리 캡스톤 주제인 모바일 로봇에 맞춰 필요한 것만 기재한 겁니다. 실제로는 더 있어요.)
- **my_robot**: 메타패키지입니다. 다른 패키지와의 종속성 목록 외에는 아무것도 포함되어 있지 않습니다.
- **my_robot_base**: Motor Control에 대한 코드들이 있습니다.
- **my_robot_bringup**: 로봇을 전체적으로 제어하는 laucnh 파일들이 있습니다.
- **my_robot_description**: 로봇의 urdf파일 혹은 mesh 파일이 있습니다.
- **my_robot_gazebo**: gazebo 환경에 로봇을 spawn하는 launch파일과 기타 config 파일들이 있습니다.
- **my_robot_slam**: slam 관련 파일들
- **my_robot_interfaces**: 커스텀 메세지 파일들
- **my_robot_navigation**: navigation 관련 파일들
- **my_robot_
- **my_robot_teleop**: teleop 관련 파일들

위의 구조를 토대로 우리가 약간씩 수정하면서 하면 됩니다. <U>단, 큰 틀은 절대 바뀌면 안됩니다.</U> **예를 들어 slam 관련 코드와 navigation 관련 코드가 한 폴더 안에 있다던지 하면 직접 코드를 작성한 사람 빼고는 아무도 모릅니다.** 따로 시간들여 찾아야 하는거죠.

참고한 자료는 아래 링크입니다!

[https://automaticaddison.com/naming-and-organizing-packages-in-large-ros-2-projects/#google_vignette](https://automaticaddison.com/naming-and-organizing-packages-in-large-ros-2-projects/#google_vignette)

# 2. 각자 해야할 일
## 2.1 Git 관점
사용법은 크게 2가지로 나뉩니다. 설명을 읽고 본인에게 맞는 사용법을 정하시면 됩니다.
1. **git 방식**
   - Git flow 방식이 이해가 잘 안된다 or 아예 모른다.
   - Git flow 방식이 무엇인지는 알지만 git-flow를 사용해본적이 없거나 모른다.
     - git-flow는 기존 git이랑 명령어가 아예 다릅니다.
     - ```git push origin feature/slam```
     - ```git flow feature publish slam```
     - 위 두 명령어는 같은 역할을 하지만 위에는 기존의 git이고 아래는 git-flow입니다.

2. **git-flow 방식**:
   - 내가 Git flow 방식이 어떤건지 이해하고 있으며 git-flow까지 사용할 줄 안다.

### 2.1.1 git 방식
1. develop 브랜치 clone 하기: ```git clone -b develop ```
2. develop 브랜치 업데이트: ```git pull origin develop```
3. remote에 없는 브랜치 삭제: ```git fetch --prune```
4. 생성할 feature 브랜치 만들기: ```git branch feature/slam```
5. feature/slam 브랜치로 이동하여 코드작성
   - ```git checkout feature/slam```
   - 이후 개발 진행하고 add랑 commit까지 완료.
     - ```git add <file>```
      - ```git commit -m "FEAT: Add EKF localization"```
6. 개발이 완료되면 develop 브랜치에 합치기(방법 2개)
   1. local 컴퓨터에서 merge 후 push: 동료들의 QA 없이 진행하는 방법. 본인코드 본인이 책임지는 것.
   ```git
   git checkout develop
   git merge feature/slam
   git push origin develop
   ```
   2. merge하지 않고 push 후 PR(Pull Request): **QA 후 Merge**. 이 때 Merge는 코드 작성자가 진행합니다. Remote에서 merge가 되었으므로 PR 후에는 Local에서의 feature 브랜치는 삭제합니다. ***(추천!!)***
   ```git
   git push origin feature/slam
   git co develop
   git branch -D feature/slam
   ```

매번 새롭게 코드를 작성할 때 마다 2~6번 과정을 반복하면 됩니다.

### 2.1.2 git-flow 방법
이거 사용할 줄 안다는 것은 이미 위 방법은 충분히 할 줄 알고, 관리까지 할 수 있는 실력이 되는거니까 구체적 설명없이 명령어로 대체합니다.
```git
git flow init
git flow feature start slam
git add <>
git commit -m "~~~~"

git flow feature finish slam
OR
git flow feature publish slam && git branch -D feature/slam

git pull develop
```
## 2.2 PR 방법
PR방식은 총 3개로 나뉩니다.
1. Create a merge commit(Merge pull request)
2. Squash and merge
3. Rebase and merge

3개에 대한 자세한 설명은 아래 5분정도 되는 영상을 보세요!
[https://www.youtube.com/watch?v=UcZ3qvapfWw](https://www.youtube.com/watch?v=UcZ3qvapfWw)

각자가 개발한 commit log에 맞게 3가지 중 선택하면 좋을 거 같아요!
잘 모르겠다 싶으면 그냥 1번으로 하시면 됩니다. 아마 기본 설정일 거에요. *물론 Commit history가 깔끔할 수록 좋습니다...*
1번은 commit history가 지저분해진다는 단점이 있지만 직관적이고, 2번은 깔끔하지만 모든 commit이 하나의 commit으로 합쳐지기 때문에 디테일이 떨어질 거에요.

# 3. 사용 시 주의할점

주의사항은 꼭 숙지 해 주세요. 생각 날 때 마다 업데이트 하겠습니다.

### 3.1 feature 브랜치는 열린 상태로 오래 유지되면 안된다.
feature 브랜치가 열린 상태로 있다는 것은 develop 브랜치에 Merge되지 않은 상태로 깃헙이든 본인 local이든 존재한다는 것입니다. 닫혀있다는 것은 Merge가 되었다는 것이구요. 하나의 작업이 끝날 때 마다 바로바로 PR 해주세요. 

### 3.2 공유 브랜치 주의사항
만약 feature/vision이라는 브랜치를 만들었고, 이는 나만 작업하는 브랜치가 아닌 여러명이 작업하는 브랜치라고 가정합시다. 이렇게 되면 당연히 local에서 merge하는게 아니라 GitHub에 올려야 합니다. **공유브랜치에서 작업할 일이 생긴다면 좀 까다롭습니다.** 각자 개발해서 올리는 기존의 방식과 달리 함께 해야하니까요. 이 경우가 캡스톤에서 발생한다면, 그 때가서 어떻게 할 지 담당자들 간의 얘기가 필요합니다.

### 3.3 공유 파일 주의사항
예를들어 ```hive_navigation.launch``` 파일을 여려명이서 작업한다고 가정합시다. 이 때는 각자 branch를 만드는 것이 아닌 공유 브랜치에서 작업 해야합니다. 구체적으로, **1번사람**이 100-200줄 사이를 수정하고, **2번사람**이 400-500줄 사이를 수정해야 하는데 각자 다른 branch에서 수정하고 merge or PR을 하면 충돌납니다. 경험상 Merge 충돌이 가장 자주 일어나는 경우가 ***"한 파일을 서로 다른 두 브랜치에서 작업하고 합칠 때*** 입니다. 다른 여려 경우도 있지만 이 경우가 제일 흔한거 같아요.

### 3.4 커밋규칙
Commit Message를 잘 작성해 주세요. 자주 쓰는 키워드는 **볼드체**하였습니다.

|키워드 |사용 시점 |
|---|---|
|**feat**| 새로운 기능 추가|
|**fix**	|버그 수정|
|docs|	문서 수정
|style|	코드 스타일 변경 (코드 포매팅, 세미콜론 누락 등), 기능 수정이 없는 경우
|design|	사용자 UI 디자인 변경 (CSS 등)
|test|	테스트 코드, 리팩토링 테스트 코드 추가
|refactor|	코드 리팩토링
|**build**|	빌드 파일 수정
|ci|	CI 설정 파일 수정
|perf|	성능 개선
|chore|	빌드 업무 수정, 패키지 매니저 수정 (gitignore 수정 등)
|**rename**|	파일 혹은 폴더명을 수정만 한 경우
|**remove**|	파일을 삭제만 한 경우

되도록 하나의 커밋에 하나의 행동을 해주세요...예를 들어 하나의 파일을 삭제함과 동시에 새로운 기능을 추가하였으면 remove와 feat으로 나눠서 작성해 주세요. 한번에 적지말구...

# 4. 기타
필수는 아니지만 하면 좋은 것들 입니다. 생각 날 때 마다 업데이트 하겠습니다.

### i)Naming Convention
변수명, 클래스명, 함수명 등등 이름짓기 규칙이 있습니다. 각자 스타일이 다 다르기 때문에 코드리뷰할 때 힘드니까 통일하는 것을 추천합니다. 통일할거면 어떻게 통일할지 정해야 하긴 합니다. 참고로 저는 아래 링크에서 설명한 대로 코드를 짭니다.

[https://rthrobot.tistory.com/2](https://rthrobot.tistory.com/2)
