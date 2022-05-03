# Metabase Server

[Metabase](https://www.metabase.com/) is an open-source business intelligence tool adopted by PyCon TW Data Team to track cross-year conference data. The docker-compose script handles four services:

- `metabase`: The Metabase server.
    - `postgres`: The database storing the data used by the Metabase server. Please get the public IP of our GCP cloud SQL and place it into [docker-compose.yml](./docker-compose.yml) 's `MB_DB_HOST`
- `nginx`: The Nginx proxy that forces HTTPS connection and passes the requests to the metabase service. See the [configuration](./nginx) for details.
- `certbot`: The service is responsible for the TSL certification auto-renewal of `metabase.pycon.tw`.

## Usage

Follow the procedures to launch the Metabase server on a machine:

1. (Run once) Set up A record for your domain and let it point to the IP address of your machine.
2. Launch the service with `docker-compose up --build -d`.
3. (Run once) Run the init script [`init.sh`](./init.sh) for activating certification renewal process.
4. Login to postgres, import the back-up data if needed (`cat <backup folder>/dump_06-02-2022_12_43_12.sql | docker exec -i metabase_server_postgres_1 psql -U postgres`) and then change its password (`ALTER USER postgres WITH PASSWORD 'postgres';`)

## Acknowledge

The scripts is implemented on the basis of [wmnnd/nginx-certbot](https://github.com/wmnnd/nginx-certbot) with the guidance from [this article](https://pentacent.medium.com/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71).

## Data Recovery

* For Postgres: Follow this [link](https://www.codegrepper.com/code-examples/sql/copy+data+from+one+postgres+container+to+another) to transfer data from the existing container
