VERSION = 0.6.1
ITERATION = 1
ARCH = all

PACKAGE = rubygem-cabin_${VERSION}-${ITERATION}_${ARCH}.deb

all: ${PACKAGE}

${PACKAGE}:
	fpm --verbose \
		-s gem \
		-t deb \
		--iteration ${ITERATION} \
		--version ${VERSION} \
		--architecture ${ARCH} \
		cabin

clean:
	rm -f ${PACKAGE}

.PHONY: clean
