#FROM cypress/browsers:chrome62
FROM cypress/base

USER root
WORKDIR /app

# Install NPM modules
COPY package.json .
RUN npm install

COPY cypress.json .
COPY cypress/fixtures cypress/fixtures
COPY cypress/plugins cypress/plugins
COPY cypress/support cypress/support
COPY cypress/integration/end2end_spec.js cypress/integration/end2end_spec.js

RUN node_modules/.bin/cypress verify

CMD ["node_modules/.bin/cypress", "run"]
