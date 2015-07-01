# Copyright 2015 Brian Hicks
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
FROM gliderlabs/alpine:edge
MAINTAINER Brian Hicks <brian@brianthicks.com>

# install Elixir (currently in the "testing" repository)
RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk add --update elixir wget ca-certificates && \
    mix local.hex --force && mix local.rebar --force && \
    apk del wget

# set basic environment variables
ENV MIX_ENV=prod
