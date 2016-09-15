# cobudget-ui

[![Code Climate](https://codeclimate.com/github/cobudget/cobudget-ui/badges/gpa.svg)](https://codeclimate.com/github/cobudget/cobudget-ui)


cobudget's user interface. for more information on the project as a whole, check out the [top-level repo](https://github.com/cobudget/cobudget)

---

### install

install node and npm: https://github.com/joyent/node/wiki/installation 

```
git clone https://github.com/cobudget/cobudget-ui
cd cobudget-ui
npm install
```

### configure

to configure `production` and other environments, copy `config/development.coffee` to `config/production.coffee` and change properties as appropriate. if you need to access other environment variables, use `process.env.var_name`, as the config is simply coffeescript.

### run

*build on watch and start livereload server:*

```
npm run develop
```

*build once and start static server:*

```
npm start
```

### deploy

*stage (push to this repo's gh-pages)*

```
npm run stage
```

*deploy (push to prod repo's gh-pages)*

```
npm run set-remote
npm run deploy
```

### Docker RUN

```
docker run --detach \
--name cobudget-ui \
--env PORT=8080 \
--env NODE_ENV=production \
--env VIRTUAL_PORT=8080 \
--env VIRTUAL_HOST=mydomain.com \ # Nginx Proxy Domain
--env NPM_ENV=production \
--env API_PROTO=http \
--env API_HOST=mydomain.com \
--env API_PORT=80 \
docker.ii.org.nz/ii/cobudget-ui:Docker_updates

```
