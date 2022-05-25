from node:16-alpine as builder

USER node

RUN mkdir -p /home/node/app
workdir /home/node/app

copy --chown=node:node ./package.json ./
run npm install

copy --chown=node:node ./ ./

Run npm run build

from nginx
copy --from=builder /home/node/app/build /usr/share/nginx/html

