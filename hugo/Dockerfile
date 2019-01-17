FROM alpine:3.8

LABEL com.github.actions.name="Hugo Build Action"
LABEL com.github.actions.description="to deploy hugo application"
LABEL com.github.actions.icon=mic
LABEL com.github.actions.color=purple

LABEL repository=http://github.com/jacexh/actions
LABEL homepage=http://github.com/jacexh/actions
LABEL maintainer="jacexh <jace.xh@gmail.com>"

RUN apk add git \
    && wget https://github.com/gohugoio/hugo/releases/download/v0.53/hugo_0.53_Linux-64bit.tar.gz \
    && tar -C /usr/loca/bin -xzvf hugo_0.53_Linux-64bit.tar.gz

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["echo", "hugo"]