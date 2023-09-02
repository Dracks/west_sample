from thevlang/vlang:alpine as base

RUN apk update
# RUN apk add postgresql-dev


from base as build

RUN v up

RUN mkdir -p /home/vlang

WORKDIR /home/vlang/

COPY v.mod .
COPY src src
# COPY static static

RUN v install
RUN v -prod -o west-sample .

RUN ls

RUN pwd

from base as runtime

WORKDIR /home/vlang
COPY --from=build /home/vlang/west-sample .
# COPY static static

EXPOSE 8010

ENTRYPOINT ["./west-sample"]

