# This variable holds a list of all the packages built by the all-packages
# target.
#
# Some of the packages need to be built in a specific order, so be wary when
# changing the list. If you're unsure, about the order of some packages, just
# ask.
PACKAGES = \
	   rubygem-ffi \
	   rubygem-childprocess \
	   rubygem-json \
	   rubygem-arr-pm \
	   rubygem-backports \
	   rubygem-cabin \
	   rubygem-clamp \
	   fpm \
	   nsq

all: help

help:
	@echo "The following targets are available from this Makefile:"
	@echo
	@echo "	clean"
	@echo "	upload-to-s3"
	@echo "	help"
	@echo

clean:
	find . -type f -iname "*.deb" -exec rm -f {} \;

upload-to-s3: $(shell find . -type f -iname "*.deb")
ifndef AWS_ACCESS_KEY_ID
	@echo "ERROR: AWS_ACCESS_KEY_ID is not defined"
	@exit 1
endif
ifndef AWS_SECRET_ACCESS_KEY
	@echo "ERROR: AWS_SECRET_ACCESS_KEY is not defined"
	@exit 1
endif
ifndef S3_BUCKET
	@echo "ERROR: S3_BUCKET is not defined"
	@exit 1
endif
	deb-s3 upload --bucket=$(S3_BUCKET) $^

.PHONY: help upload-to-s3 clean all-packages
