VERSION = 1.2.0
ITERATION = 1
ARCH = all

PACKAGE = fpm_${VERSION}-${ITERATION}_${ARCH}.deb

all: ${PACKAGE}

${PACKAGE}:
	fpm \
		--verbose \
		-s gem \
		-t deb \
		-v ${VERSION} \
		--iteration ${ITERATION} \
		--name fpm \
		fpm

clean:
	rm -f ${PACKAGE}
