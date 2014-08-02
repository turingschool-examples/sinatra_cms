require 'bundler'
Bundler.require

development_db = Sequel.sqlite('db/development.sqlite3')
test_db = Sequel.sqlite('db/test.sqlite3')

[development_db, test_db].each do |db|
  db.run "CREATE TABLE pages
          (id INTEGER PRIMARY KEY AUTOINCREMENT,
           slug VARCHAR(255),
           content VARCHAR(1023)
          )"
end
