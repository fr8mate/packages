all: help

help:
	@echo "The following targets are available from this Makefile:"
	@echo
	@echo "	upload-to-s3"
	@echo " help"
	@echo

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

.PHONY: help upload-to-s3
