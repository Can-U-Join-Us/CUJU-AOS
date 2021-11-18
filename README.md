# 같이할래? 🤝

<div align="center">
<img src="https://github.com/Can-U-Join-Us/CUJU-AOS/blob/master/images/initial_4.png" width="300">
</br>
</div>

## 프로젝트 소개

<div align="center">
<img src="https://github.com/Can-U-Join-Us/CUJU-AOS/blob/master/images/initial_1.png" width="300">
</br>
<img src="https://github.com/Can-U-Join-Us/CUJU-AOS/blob/master/images/initial_2.png" width="300">
</br>
<img src="https://github.com/Can-U-Join-Us/CUJU-AOS/blob/master/images/initial_3.png" width="300">
</br>
</div>

 **같이할래?** 는 대학생이 개인 프로젝트 진행이나 공모전 참가를 위해 분야별(FE, BE, PM 등등)로 인원을 쉽게 모집할 수 있도록 도와주는 **팀원 모집 플랫폼**입니다.

## 팀 소개

|[고도현](https://github.com/k906506)|[신희승](https://github.com/sinheeseung)|[최현석](https://github.com/201702083)|
|:-:|:-:|:-:|
|<a href="url"><img src="https://avatars.githubusercontent.com/k906506" style="border-radius:50%"></a>|<a href="url"><img src="https://avatars.githubusercontent.com/sinheeseung" style="border-radius:50%"></a>|<a href="url"><img src="https://avatars.githubusercontent.com/201702083" style="border-radius:50%"></a>|
|프론트엔드|프론트엔드|백엔드|

## 브랜치 관리 방법
feature -> develop -> master 로 관리한다.

### master
'master' 브랜치는 배포 가능한 상태만을 관리한다.  
커밋할 때는 태그를 사용해서 배포 번호를 기록한다.

### develop
'develop' 브랜치는 통합 브랜치 역할을 수행한다.  
이 브랜치를 기반으로 개발을 진행하고 모든 기능이 정상적으로 동작할 수 있는 상태를 유지해야 한다.  
기능이 추가되고 문제가 없는 경우 'master' 브랜치에 merge 한다.

### feature
'feature' 브랜치는 새로운 기능, 버그 수정이 필요할 때 'develop' 브랜치로부터 분기한다.  
개발이 완료되면 'develop' 브랜치에 merge 한다.  
'feature' 브랜치는 다음과 같이 'develop' 브랜치에서 분기한다.

```
$ git checkout -b kodohyeon_feature develop
```

'feature' 브랜치에서 모든 작업이 끝나면 다음과 같이 'develop' 브랜치로 merge하고 더이상 필요하지 않은 'feature' 브랜치는 삭제한다.

```
$ git checkout develop
Switched to branch 'develop'.
$ git merge --no-ff kodohyeon_feature
Updating asd293u...ddu9.
(Summary of changes)
$ git branch -d kodohyeon_feature
Deleted branch kodohyeon_feature.
$ git push origin develop
```
