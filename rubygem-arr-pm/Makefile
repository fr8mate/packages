VERSION = 0.0.9
ITERATION = 1
ARCH = all

PACKAGE = rubygem-arr-pm_${VERSION}-${ITERATION}_${ARCH}.deb

all: ${PACKAGE}

${PACKAGE}:
	fpm --verbose \
		-s gem \
		-t deb \
		--iteration ${ITERATION} \
		-v ${VERSION} \
		--architecture ${ARCH} \
		arr-pm

clean:
	rm -f ${PACKAGE}

.PHONY: clean
