#!/usr/bin/env bash
set -e

# اطمینان از وجود شبکه‌ی مشترک
docker network inspect fullstackapp_shared >/dev/null 2>&1 || \
  docker network create fullstackapp_shared

# بک‌اند
(cd backend && docker compose -f docker-compose.dev.yaml up -d --build)

# کمی صبر تا backend آماده شه
sleep 3

# فرانت
(cd frontend && docker compose -f docker-compose.dev.yaml up -d --build)

echo "✅ Dev stack is up"
echo "   Frontend:      http://localhost:5173"
echo "   Backend:       http://localhost:3000"
echo "   Mongo Express: http://localhost:8082"