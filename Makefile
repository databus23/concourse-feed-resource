IMAGE=databus23/concourse-feed-resource
ifneq ($(http_proxy),)
BUILD_ARGS:= --build-arg http_proxy=$(http_proxy) --build-arg https_proxy=$(https_proxy) --build-arg no_proxy=$(no_proxy)
endif
run:
	echo '{"source":{"feed":"https://rubygems.org/gems/chef/versions.atom"}, "version":{"entry":"https://rubygems.org/gems/chef/versions/12.13.37"}}' | \
		docker run --rm -i $(IMAGE) /opt/resource/check
.PHONY: in
in:
	echo '{"source":{"feed":"https://rubygems.org/gems/chef/versions.atom"}, "version":{"entry":"https://rubygems.org/gems/chef/versions/12.13.37"}}' | \
		docker run --rm -i -v $(PWD)/in:/in $(IMAGE) /opt/resource/in /in
build:
	docker build $(BUILD_ARGS) -t $(IMAGE) .

push:
	docker push $(IMAGE)
