# Sử dụng một base image có sẵn chứa Node.js và npm
FROM node:14-alpine

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Sao chép package.json và package-lock.json (nếu có) vào thư mục /app trong container
COPY package*.json ./

# Cài đặt dependencies
RUN npm install

# Sao chép toàn bộ mã nguồn vào thư mục /app trong container
COPY . .

# Build ứng dụng React
RUN npm run build

# Cấu hình môi trường chạy ứng dụng React
ENV PORT=80
ENV HOST=0.0.0.0

# Cung cấp cổng mà container lắng nghe
EXPOSE 80

# Chạy ứng dụng React khi container được khởi chạy
CMD ["npm", "start"]