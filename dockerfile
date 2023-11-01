<<<<<<< HEAD
FROM node:lts as dependencies
WORKDIR /tda
COPY package.json ./
RUN npm install --frozen-lockfile

FROM node:lts as builder
WORKDIR /tda
COPY . .
COPY --from=dependencies /tda/node_modules ./node_modules
RUN npm run build

FROM node:lts as runner
WORKDIR /tda
ENV NODE_ENV production

COPY --from=builder /tda/public ./public
COPY --from=builder /tda/package.json ./package.json
COPY --from=builder /tda/.next ./.next
COPY --from=builder /tda/node_modules ./node_modules

EXPOSE 3000
CMD ["npm", "start"]
=======
FROM node:latest AS build

WORKDIR /build


COPY package.json package.json


COPY package-lock.json package-lock.json


RUN npm ci


COPY public/ public


COPY src/ src


RUN npm run build


FROM httpd:alpine


WORKDIR /var/www/html


COPY --from=build /build/build/ .
>>>>>>> 2f07a4f3ed41a2f193f36f8e59484089ee5e3241
