#!/bin/bash

set -e

TEMPLATE_ROOT="./templates"
TARGET_ROOT="./terraform-root"
YAML_FILE="./apps.yaml"

if ! command -v yq &> /dev/null; then
  echo "Error: 'yq' is required but not installed."
  exit 1
fi

APP_COUNT=$(yq e '.apps | length' "$YAML_FILE")

for (( i=0; i<APP_COUNT; i++ )); do
  APP_NAME=$(yq e ".apps[$i].name" "$YAML_FILE")
  ENV_COUNT=$(yq e ".apps[$i].environments | length" "$YAML_FILE")

  # そのアプリ専用テンプレートディレクトリがあるか
  APP_TEMPLATE_DIR="${TEMPLATE_ROOT}/${APP_NAME}"
  USE_APP_TEMPLATE=false
  if [ -d "$APP_TEMPLATE_DIR" ]; then
    USE_APP_TEMPLATE=true
  fi

  for (( j=0; j<ENV_COUNT; j++ )); do
    ENV_NAME=$(yq e ".apps[$i].environments[$j].name" "$YAML_FILE")
    PROJECT_ID=$(yq e ".apps[$i].environments[$j].project_id // \"\"" "$YAML_FILE")

    # project_id が空なら自動生成
    if [ -z "$PROJECT_ID" ] || [ "$PROJECT_ID" == "null" ]; then
      PROJECT_ID="${APP_NAME}-${ENV_NAME}-001"
    fi

    APP_DIR="${TARGET_ROOT}/${APP_NAME}/${ENV_NAME}"
    mkdir -p "$APP_DIR"
    APP_ENV="${APP_NAME}_${ENV_NAME}"

    for FILE in main.tf variables.tf terraform.tfvars; do
      # テンプレートパス優先度: app専用 > 共通
      if $USE_APP_TEMPLATE && [ -f "${APP_TEMPLATE_DIR}/${FILE}.tpl" ]; then
        TEMPLATE_FILE="${APP_TEMPLATE_DIR}/${FILE}.tpl"
      else
        TEMPLATE_FILE="${TEMPLATE_ROOT}/${FILE}.tpl"
      fi

      TARGET_FILE="${APP_DIR}/${FILE}"

      sed -e "s|\${APP_NAME}|${APP_NAME}|g" \
          -e "s|\${ENV}|${ENV_NAME}|g" \
          -e "s|\${APP_ENV}|${APP_ENV}|g" \
          -e "s|\${PROJECT_ID}|${PROJECT_ID}|g" \
          -e "s|\${ORG_ID_PLACEHOLDER}|\\\${var.org_id}|g" \
          "$TEMPLATE_FILE" > "$TARGET_FILE"
    done

    echo "✅ Generated: ${APP_DIR} (project_id=${PROJECT_ID})"
  done
done
