CLIENT = client
DIST = dist

.phony: all clean

# ==============================================================================

all: clean ${DIST}/index.html ${DIST}/index.static.html ${DIST}/index.js

clean:
	rm -rf ${DIST}

# ==============================================================================

${DIST}:
	mkdir ${DIST}

${DIST}/index.template.html: ${DIST}
	cp index.html ${DIST}/index.template.html

${DIST}/index.static.html: ${DIST}
	node_modules/.bin/elm-static-html -o ${DIST}/index.static.html -f ${CLIENT}/Main.elm

${DIST}/index.html: ${DIST}/index.template.html ${DIST}/index.static.html
	sed -e "/static/r ${DIST}/index.static.html" ${DIST}/index.template.html > ${DIST}/index.html

${DIST}/index.js: ${DIST}
	elm-make --output=${DIST}/index.js ${CLIENT}/Main.elm
