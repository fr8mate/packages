VERSION = 0.5.5
ITERATION = 1
ARCH = amd64

PACKAGE = rubygem-childprocess_${VERSION}-${ITERATION}_${ARCH}.deb

all: ${PACKAGE}

${PACKAGE}:
	fpm --verbose \
		-s gem \
		-t deb \
		--version ${VERSION} \
		--iteration ${ITERATION} \
		--architecture ${ARCH} \
		childprocess

clean:
	rm -f ${PACKAGE}

.PHONY: clean
