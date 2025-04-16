ARG NODE_VERSION=23.11.0

FROM node:${NODE_VERSION}-alpine

WORKDIR /usr/src/app

RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/home/node/.npm \
    npm ci --omit=dev

USER node    

COPY package.json package-lock.json ./
COPY index.js queries.js ./

EXPOSE ${PORT:-3000}

CMD ["node", "index.js"]
