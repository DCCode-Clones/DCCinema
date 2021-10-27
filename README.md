# DCCinema

**Ruby version**: 3.0.0

## Configuration
You must create an `.env` file in your root directory with the following
variables:
```dotenv
## Database env vars

# development
DEV_PGDATABASE=dccinema_dev
DEV_PGUSER=your_username
DEV_PGPASSWORD=your_password
DEV_PGHOST=localhost
DEV_PGPORT=5432

# test
TEST_PGDATABASE=dccinema_test
TEST_PGUSER=your_username
TEST_PGPASSWORD=your_password
TEST_PGHOST=localhost
TEST_PGPORT=5432
```


## Database creation

```shell
rails db:create
```

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)
