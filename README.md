# README
* Try rails page count

## Packages

* Ruby version
  * 2.7.0

* Rails version
  * 6.0.3.3

## Basic setup
* Gems - useful for dev
  * gem 'pry-rails', :group => :development
  * gem 'bullet', group: 'development'

* Package - usefule for html form generation
  * `gem 'simple_form'`
  * `rails generate simple_form:install --bootstrap`

* jQuery
  * yarn add jquery
    * {project_name}/app/javascript/packs/application.js

      ```bash
      import "jquery/src/jquery"
      ...
      ```

* bootstrap
  * yarn add bootstrap popper.js (don't add popper v2, bootstrap default requires v1.16) , (no need to import popper.js manually, bootstrap will do it automatically)
    * app/javascript/packs/application.js
      * `import "bootstrap/dist/js/bootstrap"`
    * app/assets/stylesheets/application.css
      * `*= require 'bootstrap/dist/css/bootstrap'`

## Rails setup

* generate scaffold
  * `bin/rails g scaffold Book name:string author:string`
  * `bin/rails g scaffold Config name:string value:string`


## config - credential

* command
  * `EDITOR=vim bundle exec rails credentials:edit`

    ```bash
    development:
      db:
        user: user
        pass: pass

    production:
      db:
        user: user
        pass: pass
    ```

* config/database.yml

  ```bash
  default: &default
    adapter: mysql2
    encoding: utf8mb4
    pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
    username: <%= Rails.application.credentials[Rails.env.to_sym][:db][:user] %>
    password: <%= Rails.application.credentials[Rails.env.to_sym][:db][:pass] %>
    socket: /var/lib/mysql/mysql.sock

  development:
    <<: *default
    database: {project_name}_development

  test:
    <<: *default
    database: {project_name}_test

  production:
    <<: *default
    database: {project_name}_production
  ```

* Create database
  * `bundle exec rails db:create`

## Changes
* https://github.com/charlietag/test_rails_page_view/compare/v0.0.0...v0.0.1
  * Basic config and setup
    * `gem 'simple_form'`

* https://github.com/charlietag/test_rails_page_view/compare/v0.0.1...v0.0.2
  * Baisc config and setup
    * ***devise (gem)***

* https://github.com/charlietag/test_rails_page_view/compare/v0.0.2...v0.0.3
  * Start trying ***charlotte-ruby/impressionist (gem)*** ~~ankane/ahoy (gem)~~
    * Sample image
      ![sample](/screenshots/sample.png)

* https://github.com/charlietag/test_rails_page_view/compare/v0.0.2...v0.0.3
  * Start trying ***acts-as-taggable-on (gem)***


## Note
### Gems - Page Count (comparison)

* ***CHOOSE THIS HERE =>*** [charlotte-ruby/impressionist](https://github.com/charlotte-ruby/impressionist) - Use for lightweight ***page count*** purpose ***only***, not browser agent, etc..
  * Use for page count function built-in system design, lightweight page count
    * Pros
      * Easier to config, display page counts
      * ***better performance*** for web page count displaying
    * Cons
      * Not sure if is well-maintained in the future, since it's seeking for new maintainer

* [ankane/ahoy](https://github.com/ankane/ahoy) - Better use 3rd party instead like [GA](https://www.google.com/analytics)
  * Use for building ***SELF-HOSTED Analystics Platform*** like [GA](https://www.google.com/analytics)
    * Pros
      * Useful for Vistor analystics, like GA
    * Cons
      * ***Bad performance*** for displaying page count (backend: select use mysql *regex* query, not *like*)
        * Designed for BI ([ankane/blazer](https://github.com/ankane/blazer) is recommendded)
        * For better performance, better **build independently, and works with APP or Ajax framework (Vue, React)**
      * Not really designed for server-side backend, designed for modern app using js ajax log record (App, Frontend framework)
        * API + frontend js friendly
        * Server side `ahoy.track` has some issues ([issue#463](https://github.com/ankane/ahoy/issues/463), [issue#454](https://github.com/ankane/ahoy/issues/454))
          > Since properties column type is json, but this line does not convert output to json content

          ```diff
          - properties: properties,
          + properties: properties.to_json,
          ```

          > MySql/MariaDB json column type means longtext + ***check constraints***, which will check if content is json type

          ```sql
          select constraint_schema as table_schema,
          table_name,
          constraint_name,
          check_clause as definition
          from information_schema.check_constraints
          order by table_schema,
          table_name;
          ```

### Gems - Page Tag
* Gem - `mbleigh/acts-as-taggable-on` (Add tag into articles)
  * https://github.com/mbleigh/acts-as-taggable-on
