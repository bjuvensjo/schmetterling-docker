#!/usr/bin/env bash
docker run -d -t -i --rm --name schmetterling -v $(pwd)/config:/var/schmetterling/config -v $(pwd)/pipeline:/var/schmetterling/pipeline -v $(pwd)/plugin:/var/schmetterling/plugin -v $(pwd)/work_dir:/var/schmetterling/work_dir schmetterling
