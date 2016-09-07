Concourse RSS feed resource
===========================
This resource tracks an RSS feed. it can be used to trigger a pipeline whenever a new entry is added to the rss feed.

## Source Configuration
 * `feed`: The feed url which should be checked (RSS or ATOM)

## Behavior

### `check`: Check for new feed entries.

The latest entry from the RSS feed is fetched


### `in`: Fetch an entry from the feed.

Pulls down the repository image by the requested digest.

The following files will be placed in the destination:

* `/id`: The id of the feed entry
* `/title`: The titleof the feed entry



### `out`: Push an image, or build and push a `Dockerfile`.

Not implemented


## Example
```
jobs:
  - name: feed-update
    plan:
    	- get: rails-version
    	- task: do-something
    	  ...

resource:
  - name: rails-version
    type: feed
    check_every: 30m
    source:
      feed: https://rubygems.org/gems/rails/versions.atom	

resource_types:
  - name: feed
    type: docker-image
    source:
      repository: databus23/concourse-feed-resource
```