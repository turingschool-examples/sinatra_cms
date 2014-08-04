class SetupDatabase
  def filename
    "db/#{ENV['RACK_ENV']}.sqlite3"
  end

  def db
    Sequel.sqlite(filename)
  end

  def go
    db.run "CREATE TABLE pages
            (id INTEGER PRIMARY KEY AUTOINCREMENT,
             slug VARCHAR(255),
             content VARCHAR(1023)
            )"
  end

  def teardown
    system("rm #{filename}")
  end
end
