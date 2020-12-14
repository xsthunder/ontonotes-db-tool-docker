FROM node:14-alpine

VOLUME /data
WORKDIR /data

RUN yarn config set registry https://registry.npm.taobao.org

RUN yarn global add serve

ENV PATH /deps/node_modules/.bin:$PATH

CMD ["serve", "build"]
