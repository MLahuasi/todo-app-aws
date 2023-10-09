
FROM node:19-alpine3.15 as dev-deps
WORKDIR /app
COPY package.json package.json
RUN yarn install --frozen-lockfile


FROM node:19-alpine3.15 as builder
WORKDIR /app
COPY --from=dev-deps /app/node_modules ./node_modules
COPY . .
# RUN yarn test
RUN yarn build


FROM nginx:1.25.2-alpine
ENV APP_VERSION=${APP_VERSION}
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
# Inicia Nginx en segundo plano cuando se crea un contenedor a partir de esta imagen
CMD ["nginx", "-g", "daemon off;"]

