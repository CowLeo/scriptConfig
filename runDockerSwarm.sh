#!/bin/bash
docker run -d -p 2375:2376 -v $(pwd)/cluster:/tmp/cluster swarm manage  --strategy=random file:///tmp/cluster

