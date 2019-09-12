---
title:  "[SAS 프로젝트] OpenCV로 얼굴 검출하기" 
date:   2019-09-12 12:16:05 
author: BenzeneKim 
categories: SAS 
tags: SAS System_of_Agriculture_Systme 
cover:  "/assets/instacode.png" 
---

## cascade파일을 사용하여 얼굴을 찾아보자
<br></br>
<br></br>
### cascade file 이란? 
<br>cascade file은 얼굴 등의 우리가 실행하려는 기능을 조금더 쉽게 할 수 있도록 도와주는 파일이다.</br>
<br>예를 들어 얼굴을 검출할 경우 눈, 코, 입 등의 특징이 될 만한 점을 찾아 얼굴을 판별하는 것이다. </br>
<br>즉 우리가 선형대수로 계산하는 것을 안해도 된다는 것이다!!(물론 조금 더 정밀한 분석을 위해서는 필요할 것이다.)</br>
<br>그렇다면 cascade 에는 무엇이 있는지 알아보자</br>
