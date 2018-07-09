FROM hashicorp/terraform:light

ARG acme_provider_version=v1.0.0

RUN apk add --update bash jq

RUN wget -O /tmp/terraform-provider-acme.zip https://github.com/vancluever/terraform-provider-acme/releases/download/${acme_provider_version}/terraform-provider-acme_${acme_provider_version}_linux_amd64.zip \
  && unzip /tmp/terraform-provider-acme.zip \
  && mkdir -p /root/.terraform.d/plugins/linux_amd64 \
  && mv terraform-provider-acme /root/.terraform.d/plugins/linux_amd64

