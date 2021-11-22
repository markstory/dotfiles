# Enable query logging for snuba.
#export SENTRY_SNUBA_INFO=1

# Allow big nodejs processes.
export NODE_OPTIONS=--max_old_space_size=4096

# Apple M1 environment variables to fix builds of sentry & snuba
if [[ "$OS_NAME" = "Darwin" && "$OS_ARCH" = "arm64" ]]; then
    export CPATH=/opt/homebrew/Cellar/librdkafka/1.8.2/include
    export LDFLAGS=-L/opt/homebrew/Cellar/gettext/0.21/lib
fi
