This is CCC's [uffd](https://git.cccv.de/uffd/uffd) in docker-compose.

How to use
----------

1. Copy the `.example` files in `config` and edit them for your purposes. At the least, you need to add a `SECRET_KEY` using something like:

```
openssl rand -base64 33
```

2. Run `docker compose up`.

3. Populate the DB with e.g.:

```
docker compose exec app flask group create 'uffd_access' --description 'User access'
docker compose exec app flask group create 'uffd_admin' --description 'Admin access'
docker compose exec app flask role create 'base-role' --default --add-group 'uffd_access'
docker compose exec app flask role create 'admin-role' --add-group 'uffd_admin'
docker compose exec app flask user create 'testuser' --password '...' --mail '...' --displayname 'Test user'
docker compose exec app flask user create 'testadmin' --password '...' --mail '...' --displayname 'Test admin' --add-role 'admin-role'
```

4. When CCC publish a new version, run `docker compose build`.


Development
-----------

Check out `https://git.cccv.de/uffd/uffd` into this repo and uncomment the mounts in `docker-compose.yml`. Be aware that any database migrations will be run on startup, and if you want to go back to the baked-in version you may need to run `docker compose run app flask db downgrade ...`. You might want to run `docker compose run app flask db show` beforehand.

For more documentation, see the [upstream repository](https://git.cccv.de/uffd/uffd).

PRs welcome, please see the [issues](https://github.com/marksteward/uffd-docker/issues) for inspiration!
