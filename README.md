# Minvoice Project

This repository includes a boilerplate project used by Seedstars Labs. It uses Django as backend and React as frontend.

**Frontend**

* [React](https://github.com/facebook/react)
* [React Router](https://github.com/ReactTraining/react-router) Declarative routing for React
* [Babel](http://babeljs.io) for ES6 and ES7 magic
* [Webpack](http://webpack.github.io) for bundling
* [Webpack Dev Middleware](http://webpack.github.io/docs/webpack-dev-middleware.html)
* [Clean Webpack Plugin](https://github.com/johnagan/clean-webpack-plugin)
* [Redux](https://github.com/reactjs/redux) Predictable state container for JavaScript apps
* [Redux Dev Tools](https://github.com/gaearon/redux-devtools) DevTools for Redux with hot reloading, action replay, and customizable UI. Watch [Dan Abramov's talk](https://www.youtube.com/watch?v=xsSnOQynTHs)
* [Redux Thunk](https://github.com/gaearon/redux-thunk) Thunk middleware for Redux - used in async actions
* [React Router Redux](https://github.com/reactjs/react-router-redux) Ruthlessly simple bindings to keep react-router and redux in sync
* [fetch](https://github.com/github/fetch) A window.fetch JavaScript polyfill
* [tcomb form](https://github.com/gcanti/tcomb-form) Forms library for react
* [style-loader](https://github.com/webpack/style-loader), [sass-loader](https://github.com/jtangelder/sass-loader) and [less-loader](https://github.com/webpack/less-loader) to allow import of stylesheets in plain css, sass and less,
* [font-awesome-webpack](https://github.com/gowravshekar/font-awesome-webpack) to customize FontAwesome
* [bootstrap-loader](https://github.com/shakacode/bootstrap-loader) to customize Bootstrap
* [ESLint](http://eslint.org), [Airbnb Javascript/React Styleguide](https://github.com/airbnb/javascript), [Airbnb CSS / Sass Styleguide](https://github.com/airbnb/css) to maintain a consistent code style and [eslint-plugin-import](https://github.com/benmosher/eslint-plugin-import) to make sure all imports are correct
* [mocha](https://mochajs.org/) to allow writing unit tests for the project
* [Enzyme](http://airbnb.io/enzyme/) JavaScript Testing utilities for React
* [redux-mock-store](https://github.com/arnaudbenard/redux-mock-store) a mock store for your testing your redux async action creators and middleware
* [expect](https://github.com/mjackson/expect) Write better assertions
* [Nock](https://github.com/pgte/nock) HTTP mocking and expectations library
* [istanbul](https://github.com/gotwarlost/istanbul) to generate coverage when running mocha

**Backend**

* [Django](https://www.djangoproject.com/)
* [Django REST framework](http://www.django-rest-framework.org/) Django REST framework is a powerful and flexible toolkit for building Web APIs
* [Django REST Knox](https://github.com/James1345/django-rest-knox) Token based authentication for API endpoints
* [WhiteNoise](http://whitenoise.evans.io/en/latest/django.html) to serve files efficiently from Django
* [Prospector](http://prospector.landscape.io/en/master/) a complete Python static analysis tool
* [Bandit](https://github.com/openstack/bandit) a security linter from OpenStack Security
* [pytest](http://pytest.org/latest/) a mature full-featured Python testing tool
* [Mock](http://www.voidspace.org.uk/python/mock/) mocking and testing Library
* [Responses](https://github.com/getsentry/responses) a utility for mocking out the Python Requests library

## Readme Notes

* If the command line starts with $, the command should run with user privileges
* If the command line starts with #, the command should run with root privileges

## Installation - Running Docker

We use Docker as a development environment. For production, we leave you to set it up the way you feel better,
although it is trivial to extrapolate a production environment from the current docker-compose.yml.

* Install [Docker](https://www.docker.com/products/overview) and [Docker Compose](https://docs.docker.com/compose/install/).
* `$ docker-compose build`
* `$ docker-compose up`

To stop the development server:

* `$ docker-compose stop`

Stop Docker development server and remove containers, networks, volumes, and images created by up.

* `$ docker-compose down`

You can access shell in a container

* `$ docker ps  # get the name from the list of running containers`
* `$ docker exec -it minvoicebase_frontend_1 /bin/bash`

The database can be accessed @localhost:5533

* `$ psql -h localhost -p 5533 -U minvoice minvoice_dev`

## Accessing Website

The project has CORS enabled and the URL is hard-coded in javascript to http://localhost:8001
For login to work you will to use this URL in your browser.

## Testing

To make sure the code respects all coding guidelines you should run the statics analysis and test scripts before pushing any code.

Frontend (javascript tests)

* `$ ./scripts/test_local_frontend.sh`

Backend (django/python tests)

* `$ ./scripts/test_local_backend.sh`

Please take into account that test_local_backend.sh runs py.test with `--nomigrations --reuse-db` flags to allow it be performant. Any time you add a migration please remove those flags next time you run the script.

### Static analysis

Frontend (javascript static analysis)

* `$ ./scripts/static_validate_frontend.sh`

Backend (django/python static analysis)

* `$ ./scripts/static_validate_backend.sh`

## Deployment in Production

We deploy all our production code using Kubernetes. Explaining how to do deployments is beyond the scope of this boilerplate.

Here's a great article from digital ocean on how to deploy django project in a VM: https://www.digitalocean.com/community/tutorials/how-to-set-up-django-with-postgres-nginx-and-gunicorn-on-ubuntu-16-04

## Gotchas in Docker

* This project uses NodeJS v6.x (stable) and yarn
* The development server takes longer than the django server to start, as it has to install the javascript dependencies (if not already installed) and fire webpack. This means that after the django server starts, you should wait that webpack finishes compiling the .js files.
* If your IDE has builtin language support for python with auto-imports (e.g. PyCharm), you can create a virtualenv and install the py-requirements.
* If you are annoyed by docker creating files belonging to root (which is Docker's intended behaviour), you can run `# chown -hR $(whoami) .` before firing up the server.
