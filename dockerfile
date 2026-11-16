FROM node:20-alpine AS builder
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .

FROM node:20-alpine AS runner
WORKDIR /usr/src/app
USER node
COPY --from=builder --chown=node:node /usr/src/app /usr/src/app
EXPOSE 3000
CMD ["node", "server.js"]
