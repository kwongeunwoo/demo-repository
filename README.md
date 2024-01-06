# demo-repository
해당 repository는 Git에 익숙해지기 위해 연습용으로 만들었습니다. 우리가 실제로 개발할 repository가 정확히 이 repository의 설정과 동일하게 가져가려 합니다. 즉, 아래 설명을 참고하여 사용법을 익히고 이것저것 해 보길 바랍니다. 실제 프로젝트 repository가 생성되면 여기 아래 있는 것들 다 할 줄 안다고 생각하고 그냥 진행할겁니다.

목차는 아래와 같이 되어있습니다.
1. 패키지 구조화
2. Git 사용방식
3. **사용 시 주의할점(중요)**
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

# 2. Git 사용방식
사용법은 크게 2가지로 나뉩니다. 설명을 읽고 본인에게 맞는 사용법을 정하시면 됩니다.
1. **git 방식**
   - Git flow 방식이 이해가 잘 안된다 or 아예 모른다.
   - Git flow 방식이 무엇인지는 알지만 git-flow를 사용해본적이 없거나 모른다.
     - git-flow는 기존 git이랑 명령어가 아예 다릅니다.
     - ```git push origin feature/slam```
     - ```git flow publish slam```
     - 위 두 명령어는 같은 역할을 하지만 위에는 기존의 git이고 아래는 git-flow입니다.
   - 장점: 새로운 Git flow를 공부할 필요없다. 신경 쓸 필요도 없다.
   - 단점: 안그래도 귀찮은 git 작업을 더 많이 해야한다. (git-flow방식을 사용하는 것 보다 해야할게 더 많습니다.)
2. **git-flow 방식**:
   - 내가 Git flow 방식이 어떤건지 이해하고 있으며 git-flow까지 사용할 줄 안다.
   - 장점: 기존의 git 방식보다 더 편하다.
   - 단점: git이랑 같이 쓰는거라 헷갈릴 수 있다.

## i) git 방법
## ii) git-flow 방법

# 3. 사용 시 주의할점