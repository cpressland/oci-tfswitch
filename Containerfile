FROM docker.io/alpine:3 AS build
ARG TARGETARCH
ARG TERRAFORM_SWITCHER_VERSION=1.19.0

RUN apk add curl ca-certificates tar gzip

RUN curl -fSsL \
    "https://github.com/warrensbox/terraform-switcher/releases/download/v${TERRAFORM_SWITCHER_VERSION}/terraform-switcher_v${TERRAFORM_SWITCHER_VERSION}_linux_${TARGETARCH}.tar.gz" | \
    tar -xz -C /usr/local/bin tfswitch --no-same-owner

FROM scratch
COPY --from=build /usr/local/bin/tfswitch /tfswitch

# RUN curl -fSsL -o /tmp/tfswitch.tar.gz \
#     "https://github.com/warrensbox/terraform-switcher/releases/download/v${TERRAFORM_SWITCHER_VERSION}/terraform-switcher_v${TERRAFORM_SWITCHER_VERSION}_linux_${TARGETARCH}.tar.gz" && \
#     tar -xzf /tmp/tfswitch.tar.gz -C /usr/local/bin tfswitch --no-same-owner
