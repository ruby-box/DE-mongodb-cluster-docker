# Docker mongo-cluster
## 구현된 내용
* mongodb 
* 1 mongod replica shard
  * replica set (P-S-S)
* 1 mongoc replica
* 2 mongos

## 접속 
* mongos : localhost:17017 ~ 17018
* mongoc : localhost:37017 ~ 37019
* mongod : localhost:27017 ~ 27019

## 사용법

```sh
cd mongo-cluster/mongo-server
# 컨테이너 기동
docker-compose -f docker-compose-mongo-4.2.13.yml up -d

# 컨테이너 중지
# docker-compose -f docker-compose-mongo-4.2.13.yml stop

# 컨테이너 제거
# docker-compose -f docker-compose-mongo-4.2.13.yml down
```

### MongoDB 설정

#### Step1: replica set 초기화
```sh
# docker-compose -f docker-compose-mongo-4.2.13.yml exec mongoc-01 bash -c "mongo < /scripts/01-init-rs-config.sh"
# docker-compose -f docker-compose-mongo-4.2.13.yml exec mongod-01 bash -c "mongo < /scripts/02-init-rs-sh1.sh"
docker exec mongoc-01 bash -c "mongo < /scripts/01-init-rs-config.sh"
docker exec mongod-01 bash -c "mongo < /scripts/02-init-rs-sh1.sh"
```

#### Step2:  mongos 설정 (router)
```sh
# docker-compose -f docker-compose-mongo-4.2.13.yml exec mongos-01 bash -c "mongo < /scripts/03-init-mongos.sh"
docker exec mongos-01 bash -c "mongo < /scripts/03-init-mongos.sh"
```


### 기타 명령어
#### docker 기타 명령어
```sh
# 컨테이너 프로세스 확인
docker ps

# 컨테이너 로그 확인
docker logs -f mongod-01

# mongo 컨테이너 접속
docker exec -it mongod-01 bash
```

#### mongo 명령어
```sh
# mongo db 확인
docker exec -it mongos-01 bash
> mongo
> show dbs;

# replica set 정보 확인
docker exec -it mongod-01 bash
> mongo
> rs.status()
```

## 참고 링크
* https://github.com/minhhungit/mongodb-cluster-docker-compose