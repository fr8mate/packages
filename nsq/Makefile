NAME = nsq
VERSION = $(shell cat VERSION | sed 's/\s//')
ARCH = amd64
MAINTAINER = "Nick Saika <nick.s@fr8nex.com>"
ITERATION = 1
PREFIX = /usr
NSQ_URL = "http://nsq.io"

SOURCE_DIR = nsq-$(VERSION).linux-$(ARCH).go1.3.1
PACKAGE = $(SOURCE_DIR).tar.gz
DOWNLOAD_URL = https://s3.amazonaws.com/bitly-downloads/nsq/$(PACKAGE)

NSQD_SOURCE_DIR = nsqd-$(VERSION)
NSQD_DEB = nsqd_$(VERSION)-$(ITERATION)_$(ARCH).deb

NSQADMIN_SOURCE_DIR = nsqadmin-$(VERSION)
NSQADMIN_DEB = nsqadmin_$(VERSION)-$(ITERATION)_$(ARCH).deb

NSQLOOKUPD_SOURCE_DIR = nsqlookupd-$(VERSION)
NSQLOOKUPD_DEB = nsqlookupd_$(VERSION)-$(ITERATION)_$(ARCH).deb

NSQUTILS_SOURCE_DIR = nsq-utils-$(VERSION)
NSQUTILS_DEB = nsq-utils_$(VERSION)-$(ITERATION)_$(ARCH).deb

all: $(NSQD_DEB) $(NSQADMIN_DEB) $(NSQLOOKUPD_DEB) $(NSQUTILS_DEB)

$(NSQD_DEB): $(NSQD_SOURCE_DIR)
	fpm --verbose \
		--description 'the daemon that receives, queues, and delivers messages to clients' \
		-C $^ \
		-s dir \
		-t deb \
		--name nsqd \
		--version $(VERSION) \
		--iteration $(ITERATION) \
		-m $(MAINTAINER) \
		--prefix / \
		--url $(NSQ_URL) \
		--deb-upstart upstart/nsqd \
		--deb-default default/nsqd \
		usr/sbin/

$(NSQD_SOURCE_DIR): $(SOURCE_DIR)
	mkdir -p $@/usr/sbin
	cp $^/bin/nsqd $@/usr/sbin/nsqd

$(NSQADMIN_DEB): $(NSQADMIN_SOURCE_DIR)
	fpm \
		--verbose \
		--description 'a web UI to view aggregated cluster stats in realtime and perform various administrative tasks' \
		-C $^ \
		-s dir \
		-t deb \
		--name nsqadmin \
		--version $(VERSION) \
		--iteration $(ITERATION) \
		-m $(MAINTAINER) \
		--url $(NSQ_URL) \
		--prefix $(PREFIX) \
		--deb-upstart upstart/nsqadmin \
		--deb-default default/nsqadmin \
		usr/sbin/

$(NSQADMIN_SOURCE_DIR): $(SOURCE_DIR)
	mkdir -p $@/usr/sbin
	cp $^/bin/nsqadmin $@/usr/sbin/nsqadmin

$(NSQLOOKUPD_DEB): $(NSQLOOKUPD_SOURCE_DIR)
	fpm \
		--verbose \
		--description 'is the daemon that manages topology information' \
		-C $^ \
		-s dir \
		-t deb \
		--name nsqlookupd \
		--version $(VERSION) \
		--iteration $(ITERATION) \
		-m $(MAINTAINER) \
		--url $(NSQ_URL) \
		--prefix / \
		--deb-upstart upstart/nsqlookupd \
		--deb-default default/nsqlookupd \
		usr/sbin/

$(NSQLOOKUPD_SOURCE_DIR): $(SOURCE_DIR)
	mkdir -p $@/usr/sbin
	cp $^/bin/nsqlookupd $@/usr/sbin/nsqlookupd

$(NSQUTILS_DEB): $(NSQUTILS_SOURCE_DIR)
	fpm \
		--verbose \
		--description 'a collection of tools that can work with nsq clusters' \
		-C $^ \
		-s dir \
		-t deb \
		--name nsq-utils \
		--version $(VERSION) \
		--iteration $(ITERATION) \
		-m $(MAINTAINER) \
		--url $(NSQ_URL) \
		--prefix / \
		usr/bin/

$(NSQUTILS_SOURCE_DIR): $(SOURCE_DIR)
	mkdir -p $@/usr/bin
	cp \
		$^/bin/nsq_pubsub \
		$^/bin/nsq_stat \
		$^/bin/nsq_tail \
		$^/bin/nsq_to_file \
		$^/bin/nsq_to_http \
		$^/bin/nsq_to_nsq \
		$^/bin/to_nsq \
		$@/usr/bin/

$(SOURCE_DIR): $(PACKAGE)
	tar -zxvf $^

$(PACKAGE):
	@curl -LO# $(DOWNLOAD_URL)

clean: clean-dirs clean-debs clean-sources

clean-dirs:
	rm -rvf \
		$(SOURCE_DIR) \
		$(NSQD_SOURCE_DIR) \
		$(NSQADMIN_SOURCE_DIR) \
		$(NSQLOOKUPD_SOURCE_DIR) \
		$(NSQUTILS_SOURCE_DIR)
clean-debs:
	rm -f \
		$(NSQD_DEB) \
		$(NSQADMIN_DEB) \
		$(NSQLOOKUPD_DEB) \
		$(NSQUTILS_DEB)

clean-sources:
	rm -f \
		$(PACKAGE)

.PHONY: clean clean-dirs clean-debs clean-sources
