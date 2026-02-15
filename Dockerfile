FROM alpine/git AS clone
ARG REPO_URL=https://github.com/PEERS21/nginx.git
ARG REPO_BRANCH=develop
WORKDIR /tmp
RUN git clone --branch ${REPO_BRANCH} ${REPO_URL} repo

FROM nginx:stable-alpine
COPY --from=clone /tmp/repo/docker/nginx/sites-enabled/peers.conf /etc/nginx/sites-enabled/peers.conf
COPY --from=clone /tmp/repo/docker/nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
