# Changelog

### TODO

* Support `change_table :foo do |t|` style migrations (with option to activate temp table)
* Support `ActiveRecord::Migration::CommandRecorder` (`rake db:rollback`)
* Ensure index names based on original table

### 0.1.2

* Moved repo from `thickpaddy/mysql_big_table_migration` to `MakeYourLaws/mysql_big_table_migration`
* Added dependencies on ActiveRecord & Rails, removed unused rdoc, updated to minitest, moved from `Rails::VERSION` to `ActiveRecord::VERSION`
* Fixed tests - mysql can't convert 'foo0' to an integer
* Moved dependencies into gemspec, updated Gemfile.lock
* Pushed to RubyGems

### <= 0.1.1

See https://github.com/thickpaddy/mysql_big_table_migration/commits/master