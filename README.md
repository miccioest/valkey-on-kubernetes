# Valkey on Kubernetes — three ways

Companion repo for the talk **"Building a Kubernetes Operator for Valkey: Lessons from
Running It in Production"** — KCD Buenos Aires 2026, by
[Esteban Miccio](https://github.com/miccioest).

Three ways to run [Valkey](https://valkey.io) on Kubernetes, from most manual to most automated:

| Way | Folder | What it is |
|-----|--------|------------|
| 1 | [`manual/`](./manual) | Raw manifests — you author every object and form the cluster by hand |
| 2 | `helm/` | *(coming soon)* Helm chart — parameterized templates |
| 3 | `operator/` | *(coming soon)* A custom operator — a CRD + reconcile loop |

Start with [`manual/`](./manual).
