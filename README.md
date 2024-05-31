- **commit 규칙**
    
    ```
    <type> : <subject>
    
    <body>
    ```
    
    예시)
    
    ```
    Feat: 회원 가입 기능 구현
    
    SMS, 이메일 중복확인 API 개발
    ```
    
    - **type**
        - **`태그 : 제목`의 형태이며, `:`뒤에만 space가 있음**
            
            
            | type | description |
            | --- | --- |
            | Add | 새로운 기능 추가 |
            | Fix  | 버그 수정 |
            | Docs  | 문서 추가/수정 |
            | Refactor  | 코드 리펙토링 |
            | Test  | 테스트 코드, 리펙토링 테스트 코드 추가 |
            | Move | 파일, 폴더 경로 변경 |

        

  
    - **Commit 하는법(중요)**
        - 기본적으로 안드로이드 스튜디오가 아닌 **터미널**로 파일을 직접 지정해 commit작업을 수행한다.
        - 기능을 한번에 커밋하는게 아닌 작은 기능 하나하나씩 커밋 해가면서 진행한다.
        - 기능을 만들기 전에 **issue**란에 자신이 구현해야할 기능들을 작성한다 (네이밍 자유)
            
            ![스크린샷 2023-12-29 오후 2.02.25.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/9323ca01-d6e0-41ba-a2c1-cea14349fb3a/e7948539-1838-4a43-ba68-697599caf31c/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2023-12-29_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_2.02.25.png)
            
        - #~~의 숫자를 기억하고 기능을 새로 만들어 미완된 기능이나 완성된 기능을 commit시엔 branch를 기능#~~로 새로 만들어 commit 후 push 한다.
            - login#34 branch 생성 후 위의 커밋 규칙에 따라 commit→push한다
            - push전엔 누군가 pull request를 한지 확인하고, 있다면 pull request를 먼저 처리한 후
            - git pull origin main을 통해 받아온 다음에 push 를 진행한다.
            - 기능이 모두 완성었다고 판단되면 branch를 삭제한다.
        - 만약 오류나면 다시 클론 받고 새로운 branch를 생성하면 거의 해결된다..


- **🌸네이밍 규칙🌸**
    - Layout (xml file)
        - 레이아웃_기능_option(필요할 시)
        - activity_login, acitivity_signup
        - fragment_home
    - Drawable
        - xml file (속성 정의)
            - 레이아웃_속성_구성 요소
            - login_et_selector, signup_tv_background
        - resource file
            - 레이아웃_속성_detail
            - 레이아웃 : login, signup, home 등등
            - 속성 : btn, iv, ic 등등
            - detail : more(더보기), like(좋아요) 등등
            - home_btn_like.png
    - Color
        - 앱에 사용되는 모든 색상은 value-color에 저장한다.

        
        - 구성요소(공용으로 두루두루 사용되면 main)_특징(생략가능)_색상
            - main_light_blue
            - main_dark_gray
            - home_gray
        
        - 레이아웃_detail_속성_text
            - login_id_et_text
        - API 키 같은 것은 좀 더 알아볼 예정
    - font
        - 미리 지정해서 전체 적용(pretendard)
    - 속성 모음
        
        ImageView - iv
        
        Button - btn
        
        EditText - et
        
        TextView - tv
        
        ProgressBar - pb
        
        Checkbox - chk
        
        RadioButton - rb
        
        ToggleButton - tb
        
        Spinner - spn
        
        Menu - mnu
        
        ListView - lv
        
        GalleryView - gv
        
        LinearLayout -ll
        
        RelativeLayout - rl
        
        CardView - cv


