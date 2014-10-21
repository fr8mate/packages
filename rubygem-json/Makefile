VERSION = 1.7.7
ITERATION = 1
ARCH = amd64

PACKAGE = rubygem-json_${VERSION}-${ITERATION}_${ARCH}.deb

all: ${PACKAGE}

${PACKAGE}:
	fpm \
		--verbose \
		-s gem \
		-t deb \
		-v ${VERSION} \
		--iteration ${ITERATION} \
		json

clean:
	rm -f ${PACKAGE}

.PHONY: clean
