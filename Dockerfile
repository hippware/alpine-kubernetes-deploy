FROM alpine:3.6

# Install kubectl
# Note: Latest version may be found on:
# https://aur.archlinux.org/packages/kubectl-bin/
RUN apk --no-cache --update upgrade && \
    apk --no-cache add \
        ruby-irb \
        ruby-dev \
        g++ \
        make \
        ruby-rdoc \
        jq

RUN gem install kubernetes-deploy

ADD https://storage.googleapis.com/kubernetes-release/release/v1.11.9/bin/linux/amd64/kubectl /usr/bin/kubectl

RUN chmod u+x /usr/bin/kubectl

COPY deploy.sh deploy.sh
