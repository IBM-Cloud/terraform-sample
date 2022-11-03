#!/bin/bash
# returns presets value json. terraform reads logs, so be careful

presets = presets.json

curl -s http://localhost:8000/api/v1-beta/catalogs/27edcdda-ff6f-4195-b8b4-31f01ab50d03/objects/27edcdda-ff6f-4195-b8b4-31f01ab50d03-power_for_slz > $presets

echo '{"name": "mycoolname"}'