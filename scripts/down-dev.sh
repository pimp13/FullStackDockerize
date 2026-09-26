#!/usr/bin/env bash
(cd frontend && docker compose -f docker-compose.dev.yaml down)
(cd backend && docker compose -f docker-compose.dev.yaml down)