#!/usr/bin/env bash
# This is an example of a run file. Copy and modify to your needs.
BASE_DIR=/Users/magnus/git-evry/Trainee1908/docker.continuous.delivery
docker run -d -t -i --rm --name schmetterling --env-file $BASE_DIR/config/.env-secrets --env-file $BASE_DIR/config/.env -v $BASE_DIR/config:/var/schmetterling/config -v $BASE_DIR/pipeline:/var/schmetterling/pipeline -v $BASE_DIR/plugin:/var/schmetterling/plugin -v $BASE_DIR/share:/var/schmetterling/share -v $BASE_DIR/start:/var/schmetterling/start -v $BASE_DIR/work_dir:/var/schmetterling/work_dir schmetterling
