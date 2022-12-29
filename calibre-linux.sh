#!/bin/bash

ROOT=$(dirname $(findlink -f $0))
CALIBRE=$(which calibre)

echo Injecting calibre from ${ROOT}

env CALIBRE_DEVELOP_FROM=$ROOT/src ${CALIBRE}
