#!/bin/bash

NPM_ENV = ${NPM_ENV:-development}
API_PROTO = ${API_PROTO:-http://} 
API_HOST = ${API_HOST:-localhost}
API_PORT = ${API_PORT:-3000}
API_URL = ${API_URL:-"${API_PROTO}${API_HOST}:${API_PART}/api/v1"}

cat << ENV_FILE > config/${NPM_ENV}.js
module.exports = {
  apiPrefix: "${API_URL}"
}
ENV_FILE

npm start