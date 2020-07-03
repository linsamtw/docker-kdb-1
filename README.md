## Build Docker Image

- ubuntu:18.04
- KDB+ 32bit (x86)

```sh
docker build -t kdb .
```

## Run Container

```sh
docker run -d --name kdb -v $pwd:/root/q -e ON_STARTUP=/root/q/q.q -p 5000:5000 kdb

docker logs kdb

# print
0
Welcome to kdb+ 32bit edition
For support please see http://groups.google.com/d/forum/personal-kdbplus
Tutorials can be found at http://code.kx.com
To exit, type \\
To remove this startup msg, edit q.q
2020.07.03 01:35:13 Hello World!
```

### Variables

- ON_STARTUP : 실행시 구동할 파일
- PORT : 포트

## Contributors
- Mambo