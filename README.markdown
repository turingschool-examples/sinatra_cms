## SinatraCMS

A simplistic CMS using Sinatra and Sequel.

### Running the Tests

The repo likely has a `db/test.sqlite3` database already. But, if not,
run `bundle exec rake setup`.

Then run `bundle exec rake test` to execute the tests.

### Running in Development

You can start the server with automatic reloading by running `rake server`.

you can start a Pry development console by running `rake console`.
