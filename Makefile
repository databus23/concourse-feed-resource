IMAGE=databus23/concourse-feed-resource
run:
	echo '{"source":{"feed":"https://rubygems.org/gems/chef/versions.atom"}, "version":{"entry":"https://rubygems.org/gems/chef/versions/19.3.15"}}' | \
		docker run --rm -i $(IMAGE) /opt/resource/check
.PHONY: in
in:
	echo '{"source":{"feed":"https://rubygems.org/gems/chef/versions.atom"}, "version":{"entry":"https://rubygems.org/gems/chef/versions/19.3.15"}}' | \
		docker run --rm -i -v $(PWD)/in:/in $(IMAGE) /opt/resource/in /in
build:
	docker build --platform=linux/amd64 $(BUILD_ARGS) -t $(IMAGE) .

push:
	docker push $(IMAGE)
