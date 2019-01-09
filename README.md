# docker-klive-server

Docker image for running [Klive](https://github.com/soju6jan/KLive) server
- linuxserver alpine base image with s6 overlay
- python 2.7


## 사용법

```yaml
version: '3.5'

services:
  klive:
    image: wiserain/klive
    container_name: klive
    restart: always
    network_mode: "bridge"
    ports:
      - "9801:9801"
    volumes:
      - ${DOCKER_ROOT}/klive/config:/config
    environment:
      - PUID=${PUID}
      - PGID=${PGID}
```

먼저, 위의 기본 설정을 참고하여 컨테이너를 만들고 실행합니다. 초기화 단계에서 klive 사용자 설정 파일인 ```setting.py```와 ```custom.txt``` 파일이 ```/config```에 준비될 때까지 대기합니다. 이미 사용하던 파일이 있다면 ```/config``` 아래에 복사하면 됩니다. 처음 사용자라면 다음 명령어를 실행하여 기본 설정 파일을 복사합니다.

```bash
docker-compose exec <service_name> klive_setup
```

```/config``` 아래에 준비된 ```*.sample``` 파일을 원하는대로 수정한 후 확장자를 지워서 저장하면 컨테이너가 인식하고 klive server를 실행하게 됩니다.
