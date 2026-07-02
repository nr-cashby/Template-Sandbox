#!/bin/bash

# Ensure the script stops if any command fails
set -e

echo "🚀 Initializing your All Product Sandbox environment..."

# 1. Create the Directory Structure
echo "📁 Creating directories..."
mkdir -p "!unused/shared-logs"
mkdir -p "apm-services/unused/java"
mkdir -p "apm-services/unused/php"
mkdir -p "data-stores/unused/caches"
mkdir -p "data-stores/unused/databases"
mkdir -p "documentation"
mkdir -p "infra/unused/k8s"
mkdir -p "infra/unused/newrelic-configs"

# 2. Create Root .env File
echo "🔑 Creating root .env file..."
cat << 'EOF' > .env
# --- New Relic Global Sandbox Configuration ---
# Replace placeholders with your actual New Relic credentials

NEW_RELIC_LICENSE_KEY=your_nr_license_key_here
NEW_RELIC_ACCOUNT_ID=your_nr_account_id_here
NEW_RELIC_REGION=EU # Change to US if your account is US-hosted

# --- Local Infrastructure Configs ---
SHARED_LOGS_PATH=./shared-logs
EOF

# 3. Pre-populate Documentation: 0. Guidance on Use.md
echo "📝 Writing Guidance on Use documentation..."
cat << 'EOF' > "documentation/0. Guidance on Use.md"
# Sandbox Guidance on Use

## The Core Blueprint
The core folders (`apm-services`, `data-stores`, and `infra`) are the constant bread-and-butter setup of this sandbox.

## Component-Level Inactivity (`unused/`)
Every core folder features its own `unused/` bin. When components are actively being tested, pull their sub-types out into the root of their respective parent folder. When done, tidily dump them back into `unused/` to keep the active workspace clean.

- **/apm-services**: Subfolders for each kind of New Relic APM agent (e.g., `/java`, `/php`).
- **/data-stores**: Structured with `/caches` (e.g., Redis, Memcached) and `/databases` for full-scale persistent engines (SQL, NoSQL, Document, or Graph stores).
- **/infra**: Houses environments, docker-compose setups, Kubernetes configurations, and agent-level integrations.
- **/shared-logs**: Dedicated directory for local log-forwarding orchestration testing.

## Global-Level Inactivity (`!unused/`)
The root `!unused/` folder is reserved for high-level ecosystem concepts or core paradigms that are not currently being interacted with but remain preserved for later exploration.
EOF

# 4. Pre-populate Documentation: useful_commands.md
echo "📝 Writing Useful Commands documentation..."
cat << 'EOF' > "documentation/useful_commands.md"
# Useful Sandbox Commands

## Inspect Current Sandbox Structure
Visualize the active state of your components:
tree

## Run from root with Docker Compose (accesses .env in root)
docker compose -f infra/docker-compose.yml up -d
EOF

#5. docker-compose
cat << 'EOF' > "infra/unused/docker-compose.yml"
EOF
