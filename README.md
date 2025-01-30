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
docker compose run app flask group create 'uffd_access' --description 'User access'
docker compose run app flask group create 'uffd_admin' --description 'Admin access'
docker compose run app flask role create 'base-role' --default --add-group 'uffd_access'
docker compose run app flask role create 'admin-role' --add-group 'uffd_admin'
docker compose run app flask user create 'testuser' --password '...' --mail '...' --displayname 'Test user'
docker compose run app flask user create 'testadmin' --password '...' --mail '...' --displayname 'Test admin' --add-role 'admin-role'
```

PRs welcome!
