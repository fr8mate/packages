VERSION = 1.9.6
ITERATION = 1
ARCH = amd64

PACKAGE = rubygem-ffi_${VERSION}-${ITERATION}_${ARCH}.deb

all: ${PACKAGE}

${PACKAGE}:
	fpm --verbose \
		-s gem \
		-t deb \
		--version ${VERSION} \
		--iteration ${ITERATION} \
		--architecture ${ARCH} \
		ffi

clean:
	rm -f ${PACKAGE}

.PHONY: clean
