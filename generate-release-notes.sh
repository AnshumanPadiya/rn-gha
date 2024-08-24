#!/bin/bash

# Get the latest tag
LATEST_TAG=$(git describe --tags `git rev-list --tags --max-count=1`)

# Get the commit messages since the latest tag
COMMITS=$(git log ${LATEST_TAG}..HEAD --pretty=format:"- %s")

# Create the release notes file
echo "## Release Notes" > release-notes.md
echo "" >> release-notes.md
echo "### Changes since ${LATEST_TAG}" >> release-notes.md
echo "" >> release-notes.md
echo "${COMMITS}" >> release-notes.md

echo "Release notes generated and saved to release-notes.md"