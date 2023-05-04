FROM dart
WORKDIR /app
RUN dart pub global activate --source git https://github.com/zoocityboy/unpubdev
ENV PATH="$PATH:/root/.pub-cache/bin"
EXPOSE 4000
ADD entrypoint.sh /app
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.11.0/wait /wait
RUN chmod +x /wait
CMD /wait && /app/entrypoint.sh