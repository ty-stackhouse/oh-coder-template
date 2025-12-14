#!/bin/bash
REPO=$1

gh secret set LLM_API_KEY --body $GH_LLM_API_KEY
gh secret set PAT_USERNAME --body $GH_PAT_USERNAME
gh secret set PAT_TOKEN --body $GH_PAT_TOKEN

