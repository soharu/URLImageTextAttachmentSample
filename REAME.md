# URLImageTextAttachementSample

비동기 이미지 설정을 지원하는 NSTextAttachement 만들기

## Set Up

```
pod install
open URLImageTextAttachmentSample.xcworkspace
```

## 참고 사항

* 아래 블로그 포스트를 참고 하여 작성
  * [Asynchronous NSTextAttachments (2/2)](https://www.cocoanetics.com/2016/09/asynchronous-nstextattachments-22/) / [Sample Project](https://github.com/Cocoanetics/Swift-Examples)
* 이미지 다운로드 및 캐시는 [Kingfisher](https://github.com/onevcat/Kingfisher) 이용
* 다운로드된 이미지의 크기를 폰트 크기(lineHeight)에 맞춰 표시하도록 함
