# ---------- build stage ----------
FROM node:24.18.0-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install && npm cache clean --force

COPY . .
RUN npm run build

# ---------- runtime stage با Nginx ----------
FROM nginx:1.27-alpine

# کانفیگ سفارشی nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# فایل‌های build شده
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]