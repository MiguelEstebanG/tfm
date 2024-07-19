#!/bin/bash

mongosh <<EOF
use TFM
db.createCollection("earthquakes")
EOF