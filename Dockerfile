FROM alpine:latest
RUN apk --update add ca-certificates \
                     mailcap \
                     curl

HEALTHCHECK --start-period=2s --interval=5s --timeout=3s \
  CMD curl -fs http://localhost/health || exit 1

EXPOSE 80

COPY docker_config.json /.filebrowser.json
COPY filebrowser /filebrowser

ENTRYPOINT [ "/filebrowser" ]
