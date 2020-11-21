
0. application.yaml에 mysql 설정 및 application-mysql.properties에 도메인(mysql-service.default.svc.cluster.local) 호출 설정
1. gradle build 진행 후 결과 확인 build.gradle
2. Dockerfile에 uid 1000 설정 포함하여 이미지 빌드
 $ docker build -t localsystem-spring:latest . 
3. 빌드한 이미지로 k8s경로 하위에 manifest 파일을 통해 배포 (deployment, statefulset, service, ingress, pv, pvc)
 $ k apply -f 파일명
 - default namespace에 배포
 - deployment yaml에 hostPath(/logs), Liveness/Readiness, RollingUpdate, terminationGracePeriodSeconds
 - statefulset에 pvc
4. nginx-ingress-controller 설치
 - 다음 git을 통해 ingress-nginx-controller 설치
     https://github.com/kubernetes/ingress-nginx.git
  $ cd ./ingress-nginx/deploy/static/provider/baremetal
  $ k apply -f .
5. DNS 또는 hosts 파일 설정 후 호출 테스트
