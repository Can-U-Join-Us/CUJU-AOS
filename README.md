

# 소프트웨어공학 팀프로젝트
프로젝트 인원 모집 플랫폼 : 같이할래? (Can you join us?)

# 브랜치 관리 방법
feature -> develop -> master 로 관리한다.

## master
'master' 브랜치는 배포 가능한 상태만을 관리한다.  
커밋할 때는 태그를 사용해서 배포 번호를 기록한다.

## develop
'develop' 브랜치는 통합 브랜치 역할을 수행한다.  
이 브랜치를 기반으로 개발을 진행하고 모든 기능이 정상적으로 동작할 수 있는 상태를 유지해야 한다.  
기능이 추가되고 문제가 없는 경우 'master' 브랜치에 merge 한다.

## feature
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
