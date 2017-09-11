CLIENT = client
DIST = dist

.phony: all clean cleanBuild

# ==============================================================================

all: node_modules clean ${DIST}/index.html ${DIST}/index.js

open: all
	@(which open) && (@open ${DIST}/index.html) || (@xdg-open ${DIST}/index.html) 2> /dev/null

clean:
	@rm -rf ${DIST}

node_modules:
	npm install

# ==============================================================================

${DIST}:
	@mkdir ${DIST}

${DIST}/index.js: ${DIST}
	@node_modules/.bin/elm-make --yes --output=${DIST}/index.js ${CLIENT}/Main.elm

${DIST}/index.template.html: ${DIST}
	@cp index.html ${DIST}/index.template.html

${DIST}/index.static.html: ${DIST}
	@node_modules/.bin/elm-static-html -o ${DIST}/index.static.html -f ${CLIENT}/Main.elm

${DIST}/index.html: ${DIST}/index.template.html ${DIST}/index.static.html
	@sed -e "/static/r ${DIST}/index.static.html" ${DIST}/index.template.html > ${DIST}/index.html

cleanBuild: ${DIST}/index.html
	@rm ${DIST}/index.template.html ${DIST}/index.static.html
