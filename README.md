## InvoiceExport.tk

This is the primary site for [InvoiceExport.herokuapp.com](https://www.InvoiceExport.herokuapp.com).  It is
a Invoice webapp to generate invoices with client, product, company and more.

### Development

#### NEVER PUSH TO MASTER

You are never to push to the `master` branch in this repository.  The only way to get code into the project's master branch is to:

- Create a feature branch off of master.
- Write code and tests for that code in this branch until you're happy with it.
- Open a new Pull Request requesting to merge this branch into master.

#### Setup

After you've looked at the "Configuration" section below, you can just run the
following to get everything installed, set up the database, and run the tests:

```sh
bundle
cp config/database.yml.example config/database.yml
rake db:create
rake db:migrate
rake setup
```

#### Configuration

Two basic prerequisites for the site are the `bundler` gem and
[Ruby](https://rvm.io/rvm/upgrading). To install bundler:

```sh
gem install bundler
```

You also need `PostgreSQL 9.5` with `hstore` enabled. You also need a few
environment variables. We tend to use [direnv](http://direnv.net/) to manage
environment variables; you can see the variables we require below, in an example
`.envrc` file:

```sh
# PG
export PGUSER=XXX
export PGPASSWORD=XXXX

# Rails info
export SECRET_KEY_BASE=xxxxxxxx

```

Also, you need phantomjs [phantomJS](https://gist.github.com/julionc/7476620) to test
the components with rake spinach

#### Stylelint

We use `Stylelint` to lint our scss files, to install just run:

```sh
npm install -g stylelint
npm install -D stylelint stylelint-scss stylelint-order
```

Now you can lint the scss files:

```
stylelint app/assets/**/*.scss --scss syntax
```
© 2017 InvoiceExport
