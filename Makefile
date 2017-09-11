SRC = src
DIST = dist

.phony: all clean

# ==============================================================================

all: clean ${DIST}/index.html ${DIST}/index.js

clean:
	rm -rf ${DIST}

# ==============================================================================

${DIST}:
	mkdir ${DIST}

${DIST}/index.html: ${DIST}
	cp index.html ${DIST}/index.html

${DIST}/index.js: ${DIST}
	elm-make --output=${DIST}/index.js ${SRC}/Main.elm
