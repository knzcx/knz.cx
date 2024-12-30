FROM node:16 AS node-builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build || true

FROM klakegg/hugo:0.101.0-ext AS hugo
WORKDIR /src
COPY . .
COPY --from=node-builder /app/node_modules ./node_modules
EXPOSE 1313
CMD ["server", "--bind", "0.0.0.0"] 