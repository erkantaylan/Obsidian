---
tags:
  - unix
  - cli
  - json
---

# jq

Lightweight command-line JSON processor. Filter, transform, and format JSON data from the terminal.

## Install

```bash
sudo apt install jq
```

## Usage

```bash
# Pretty print JSON
echo '{"name":"erkan"}' | jq .

# Extract a field
cat data.json | jq '.name'

# Array operations
cat data.json | jq '.[0]'           # first element
cat data.json | jq '.[] | .name'    # map over array

# Filter
cat data.json | jq '.[] | select(.age > 30)'

# Multiple fields
cat data.json | jq '{name: .name, age: .age}'

# Use with curl
curl -s https://api.example.com | jq '.results[].title'
```

## Links

- [jq Website](https://jqlang.github.io/jq/)
- [jq Manual](https://jqlang.github.io/jq/manual/)
- [jq Playground](https://jqplay.org/)
