# README

## Development

You will need to have docker installed in your machine. First build the images:

```bash
docker-compose build
```

Then setup the database

```bash
docker-compose run app bin/setup
```

Finally start the development server

```bash
docker-compose up app
```

## Debugging

If you need to use `byebug` run the server in deamon mode and the attach to the container running the app

```bash
docker-compose up -d app && docker attach simplefoods_app_1
```
