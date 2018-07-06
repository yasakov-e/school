# SCHOOL APPLICATION

* Database setup:

  Check  `config/database.yml` file, there you can find default username and password to access db.

  To everything works, you should create a new user:

  In terminal: `sudo su postgres`

  Then: `psql`

  Create user: `CREATE USER school_app WITH PASSWORD '12345678';`

<<<<<<< HEAD
  Grant all privileges: `ALTER USER school_app WITH SUPERUSER;`
=======
  Grant all privileges: `ALTER USER school_app WITH SUPERUSER`
>>>>>>> f5696eefd4e6fe227699610639a75f661538f041

  `\q` and `exit` to exit

  Finally, run `rake db:setup` in your app directory.
