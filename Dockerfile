# Docker nif checker service

# Compile binary
FROM alpine:edge as compiler
# libraries:
# * musl-dev  =  libc dev libraries
# * curl-dev  =  we use web services so we need curl
RUN apk add --update crystal=0.27.0-r0 musl-dev curl-dev upx
WORKDIR /app
ADD . /app
RUN cd /app && crystal -v && crystal build --progress --no-debug --static --release src/static_bin.cr && upx static_bin
