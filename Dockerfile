FROM node:20-alpine AS builder

WORKDIR /app

# bust cache to force rebuild when code changes
ARG CACHEBUST=1

COPY package*.json ./
RUN npm ci

COPY . .

# URL do backend MAX — hardcoded como default seguro
ENV NEXT_PUBLIC_API_URL=https://max.vendai.pro

RUN npm run build

# ── Runner ────────────────────────────────────────────────────────────────────
FROM node:20-alpine

WORKDIR /app

RUN npm install -g serve

COPY --from=builder /app/out ./out

EXPOSE 3000

CMD ["sh", "-c", "serve -s out -l ${PORT:-3000}"]
