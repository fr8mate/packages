VERSION = 3.6.3
ITERATION = 1
ARCH = all

PACKAGE = rubygem-backports_${VERSION}-${ITERATION}_${ARCH}.deb

all: ${PACKAGE}

${PACKAGE}:
	fpm --verbose \
		-s gem \
		-t deb \
		--version ${VERSION} \
		--iteration ${ITERATION} \
		--architecture ${ARCH} \
		backports

clean:
	rm -f ${PACKAGE}

.PHONY: clean
