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
