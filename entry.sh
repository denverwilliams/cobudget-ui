#!/bin/bash

export NPM_ENV="${NPM_ENV:-production}"
export API_PROTO="${API_PROTO:-http}"
export API_HOST="${API_HOST:-api.ii.org.nz}"
export API_PORT="${API_PORT:-80}"
export API_URL="${API_PROTO}://${API_HOST}:${API_PORT}/api/v1"

cat << ENV_FILE > config/${NPM_ENV}.js
module.exports = {
  apiPrefix: "${API_URL}"
}
ENV_FILE

npm start