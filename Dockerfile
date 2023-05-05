FROM --platform=$BUILDPLATFORM dart
ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM" > /log

WORKDIR /app
RUN dart pub global activate --source git https://github.com/zoocityboy/unpubdev
ENV PATH="$PATH:/root/.pub-cache/bin"
EXPOSE 4000
COPY entrypoint.sh /app
COPY --from=ghcr.io/ufoscout/docker-compose-wait:latest /wait /wait
CMD /wait && /app/entrypoint.sh