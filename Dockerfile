# 1. alpine 설치 (패키지 업데이트 + 만든사람 표시)
FROM php:apache
MAINTAINER drs@drs.pe.kr

# 2. 필요파일 복사
COPY ./comix-server /data/comix-server
COPY ./conf/comix.conf /etc/apache2/conf.d
COPY ./docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh

# 3. 아파치 수정
RUN sed -i '/LoadModule rewrite_module/s/^#//g' /etc/apache2/httpd.conf
RUN mkdir -p /run/apache2

# 4. 언어 설정
ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

# 5. TimeZone 설정
ENV TZ Asia/Seoul

# 6. 초기실행
VOLUME ["/data/manga"]
ENV PASSWORD 1234
EXPOSE 31257
ENTRYPOINT /docker-entrypoint.sh
