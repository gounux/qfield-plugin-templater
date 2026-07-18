# Create or update the "Artefacts generated" comment on the current merge request.
# Usage: post_mr_comment.sh <zip_name> <zip_url> <qr_url>
set -euo pipefail

ZIP_NAME="$1"
ZIP_URL="$2"
QR_URL="$3"

if [ -z "${GITLAB_TOKEN:-}" ]; then
  echo "Error: the GITLAB_TOKEN CI/CD variable is not set." >&2
  echo "Create a project/personal access token with the 'api' scope and add it as a CI/CD variable named GITLAB_TOKEN." >&2
  exit 1
fi

COMMENT_MARKER="📦 Artefacts generated"
COMMENT_BODY="## ${COMMENT_MARKER}

| Element | Value |
|---------|-------|
| 📥 ZIP file | [\`${ZIP_NAME}\`](${ZIP_URL}) |
| 🔑 Commit | \`${CI_COMMIT_SHORT_SHA}\` |
| 🆕 Pipeline | [#${CI_PIPELINE_IID}](${CI_PIPELINE_URL}) |

---

### 📱 QR Code: Flash in QField to test

<img src=\"${QR_URL}\" alt=\"QR Code\" width=\"360\"/>"

NOTES_URL="${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/merge_requests/${CI_MERGE_REQUEST_IID}/notes"

# Find an existing bot comment containing the marker
LIST_RESPONSE=$(mktemp)
HTTP_STATUS=$(curl --silent --output "${LIST_RESPONSE}" --write-out "%{http_code}" \
  --header "PRIVATE-TOKEN: ${GITLAB_TOKEN}" \
  "${NOTES_URL}?per_page=100")

if [ "${HTTP_STATUS}" != "200" ]; then
  echo "Error: failed to list merge request notes (HTTP ${HTTP_STATUS})." >&2
  echo "Check that GITLAB_TOKEN is valid and has the 'api' scope." >&2
  cat "${LIST_RESPONSE}" >&2
  exit 1
fi

EXISTING_NOTE_ID=$(jq --arg marker "${COMMENT_MARKER}" '[.[] | select(.body | contains($marker))][0].id // empty' "${LIST_RESPONSE}")

COMMENT_JSON=$(jq -n --arg body "${COMMENT_BODY}" '{"body": $body}')
NOTE_RESPONSE=$(mktemp)

if [ -n "${EXISTING_NOTE_ID}" ]; then
  ACTION="update"
  HTTP_STATUS=$(curl --silent --output "${NOTE_RESPONSE}" --write-out "%{http_code}" \
    --request PUT \
    --header "PRIVATE-TOKEN: ${GITLAB_TOKEN}" \
    --header "Content-Type: application/json" \
    --data "${COMMENT_JSON}" \
    "${NOTES_URL}/${EXISTING_NOTE_ID}")
else
  ACTION="create"
  HTTP_STATUS=$(curl --silent --output "${NOTE_RESPONSE}" --write-out "%{http_code}" \
    --request POST \
    --header "PRIVATE-TOKEN: ${GITLAB_TOKEN}" \
    --header "Content-Type: application/json" \
    --data "${COMMENT_JSON}" \
    "${NOTES_URL}")
fi

if [ "${HTTP_STATUS}" != "200" ] && [ "${HTTP_STATUS}" != "201" ]; then
  echo "Error: failed to ${ACTION} the merge request comment (HTTP ${HTTP_STATUS})." >&2
  cat "${NOTE_RESPONSE}" >&2
  exit 1
fi

if [ "${ACTION}" = "update" ]; then
  echo "Updated existing MR comment (note ID: ${EXISTING_NOTE_ID})"
else
  echo "Created new MR comment"
fi
