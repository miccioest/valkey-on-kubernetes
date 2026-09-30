#!/usr/bin/env bash
# Form the Valkey cluster once all 6 pods are running.
# 3 primaries + 3 replicas (--cluster-replicas 1).
set -euo pipefail

NS="${NS:-valkey-demo}"

echo "Waiting for all pods to be ready..."
kubectl -n "$NS" rollout status statefulset/valkey --timeout=180s

echo "Collecting pod IPs..."
NODES=""
for i in $(seq 0 5); do
  IP=$(kubectl -n "$NS" get pod "valkey-$i" -o jsonpath='{.status.podIP}')
  NODES="$NODES $IP:6379"
done

echo "Creating the cluster with:$NODES"
kubectl -n "$NS" exec -it valkey-0 -- \
  valkey-cli --cluster create $NODES --cluster-replicas 1 --cluster-yes

echo "Verifying..."
kubectl -n "$NS" exec valkey-0 -- valkey-cli cluster info
# Expect: cluster_state:ok · cluster_slots_assigned:16384 · cluster_known_nodes:6
