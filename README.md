# Mini Elixir

Mini Elixir is a miniature (34M) Docker container that has only what you'll need
to run Elixir/Erlang apps. It's based off of Alpine Linux.

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc/generate-toc again -->
**Table of Contents**

- [Mini Elixir](#mini-elixir)
    - [Sample usage](#sample-usage)
    - [Tags](#tags)

<!-- markdown-toc end -->

## Sample usage

    FROM brianhicks/minielixir:latest
    MAINTAINER Your Name <you@yourcompany.com>

    # groundwork
    WORKDIR /app
    ENV NODE_NAME=yourapp
    ENV NODE_COOKIE=yourcookie
    ENV PORT=4000

    # install dependencies
    ADD mix.exs /app/mix.exs
    RUN mix deps.get && mix deps.compile

    # compile app
    ADD . /app
    RUN mix compile

    CMD elixir --name $NODE_NAME@$HOSTNAME --cookie $NODE_COOKIE -S mix phoenix.server

## Tags

- `latest` is the only tag at the moment, once Elixir is released into
  mainstream Alpine linux, tags will be built for each release.
