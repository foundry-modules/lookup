SRC_DIR = source
BUILD_DIR = build
UGLIFY = uglifyjs --unsafe -nc
FOUNDRY_DIR = ../..
PRODUCTION_DIR = ${FOUNDRY_DIR}/scripts
DEVELOPMENT_DIR = ${FOUNDRY_DIR}/scripts_
MODULARIZE = ${FOUNDRY_DIR}/build/modularize
BASE_FILES = ${SRC_DIR}/jquery.lookup.js

all: premake body min foundry

premake:
	mkdir -p ${BUILD_DIR}

body:
	@@cat ${BASE_FILES} > ${BUILD_DIR}/jquery.lookup.js

min:
	${UGLIFY} ${BUILD_DIR}/jquery.lookup.js > ${BUILD_DIR}/jquery.lookup.min.js

foundry:
	${MODULARIZE} -n "lookup" ${BUILD_DIR}/jquery.lookup.js > ${DEVELOPMENT_DIR}/lookup.js
	${UGLIFY} ${DEVELOPMENT_DIR}/lookup.js > ${PRODUCTION_DIR}/lookup.js




