$ErrorActionPreference='SilentlyContinue'
"=== DIR C:\Files"
Get-ChildItem C:\Files -Force -Recurse | ForEach-Object { $_.FullName + "  " + $_.Length }
"=== PY"
(where.exe python) -join ';'
python -V 2>&1
"=== ENV"
Get-Content C:\Files\.env
"=== PIP"
pip list 2>&1 | Select-String -Pattern "azure|openai|mcp|dotenv|agents|identity"
"=== CREATE_AGENT"
Get-Content C:\Files\create_agent.py
"=== END"
