# 계산기 서비스 (Spring Boot)

간단한 계산기 서비스입니다. 숫자 두 개와 연산자(+, -, *, /, %)를 입력하면 결과를 반환합니다. 프론트엔드는 Bootstrap을 사용한 단일 페이지입니다.

빌드 및 실행

1. JDK 17 이상 필요
2. 빌드 및 실행:

```bash
mvn package
java -jar target/calculator-0.0.1-SNAPSHOT.jar
```

브라우저에서 열기:

http://localhost:8080/

API 예시 (cURL)

```bash
curl -X POST -H "Content-Type: application/json" -d '{"a":10,"b":3,"op":"/"}' http://localhost:8080/api/calc
```

Docker 사용

이미지 빌드:

```bash
./build-docker.sh
```

컨테이너 실행:

```bash
./run-docker.sh
```

브라우저에서 열기: http://localhost:8080/

CI (GitHub Actions) — Docker 이미지 자동 빌드 및 푸시

이 저장소에는 `main` 브랜치에 푸시되거나 릴리스가 발행될 때 이미지를 빌드하고 GitHub Container Registry(GHCR)에 푸시하는 GitHub Actions 워크플로우가 포함되어 있습니다.

필요한 시크릿(선택):
- `DOCKERHUB_USERNAME` 및 `DOCKERHUB_TOKEN` — DockerHub에도 푸시하려면 설정하세요.

이미지 위치 예시:
- GHCR: ghcr.io/<OWNER>/calculator:latest

이미지 태깅 및 릴리스
- Git 태그를 푸시하면 워크플로우가 해당 태그로도 이미지를 빌드·푸시합니다. 예: `git tag v1.0.0 && git push origin v1.0.0` → GHCR에 `ghcr.io/<OWNER>/calculator:v1.0.0` 생성

컨테이너/이미지 정리 명령
```bash
# 중지 및 제거
docker rm -f calculator-container || true
# 이미지 제거
docker rmi calculator:latest || true
```

# nomadnote
