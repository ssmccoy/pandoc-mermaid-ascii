# Architecture

The request path is straightforward:

``` mermaid
graph LR
A[Client] --> B[LB]
B --> C[app-1]
B --> D[app-2]
C --> E[Postgres]
D --> E
```

Everything else is YAML.
