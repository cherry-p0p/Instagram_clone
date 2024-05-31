- **commit 규칙**
    
    ```
    <type> : <subject>
    
    <body>
    ```
    
    예시)
    
    ```
    [Feat]회원 가입 기능 구현
    
    SMS, 이메일 중복확인 API 개발
    ```
    
    - **type**
        - **`태그 : 제목`의 형태이며, `:`뒤에만 space가 있음**
            
            
            | type | description |
            | --- | --- |
            | Feat | 새로운 기능 추가 |
            | Fix  | 버그 수정 |
            | Docs  | 문서 추가/수정 |
            | Refactor  | 코드 리펙토링 |
            | Test  | 테스트 코드, 리펙토링 테스트 코드 추가 |
            | Move | 파일, 폴더 경로 변경 |

        

  
    - **Commit 하는법(중요)**
        - 기본적으로 **터미널**로 파일을 직접 지정해 commit작업을 수행한다.
        - 기능을 한번에 커밋하는게 아닌 작은 기능 하나하나씩 커밋 해가면서 진행한다.
        - 기능을 만들기 전에 **issue**란에 자신이 구현해야할 기능들을 작성한다 (네이밍 자유)

            
        - #~~의 숫자를 기억하고 기능을 새로 만들어 미완된 기능이나 완성된 기능을 commit시엔 branch를 기능#~~로 새로 만들어 commit 후 push 한다.
            - login#34 branch 생성 후 위의 커밋 규칙에 따라 commit→push한다
            - push전엔 누군가 pull request를 한지 확인하고, 있다면 pull request를 먼저 처리한 후
            - git pull origin main을 통해 받아온 다음에 push 를 진행한다.
            - 기능이 모두 완성었다고 판단되면 branch를 삭제한다.
        - 만약 오류나면 다시 클론 받고 새로운 branch를 생성하면 거의 해결된다..


- **🌸네이밍 규칙🌸**

            |   이름   |     구현파트      |
            | ------- | --------------- |
            |   Eva   | Login / Search  |
            | Cherry  |       Feed      |
            |   Wis   |     Profile     |
            | Dongdong|   DM / Reels    |


    - Swift (swift file)
        - 구현파트View
  
    - Assets
        - 사진
            - 구현파트_사진이름
              
    - Color
        - 구현파트_색이름

        - 구성요소(공용으로 두루두루 사용되면 main)_특징(생략가능)_색상
            - main_light_blue
            - main_dark_gray
            - home_gray

    - 구조체명
        - struct 구현파트_구조체이름 :     

    - 변수명
        - let 구현파트_변수이름 :     



