$LOAD_PATH.unshift 'lib'
require "mysql_big_table_migration/version"

Gem::Specification.new do |s|
  s.name              = "mysql_big_table_migration"
  s.version           = MySQLBigTableMigration::VERSION
  s.platform          = Gem::Platform::RUBY
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "allow columns and indexes to be added to and removed from large tables"
  s.homepage          = "http://github.com/MakeYourLaws/mysql_big_table_migration"
  s.email             = "sai@makeyourlaws.org"
  s.authors           = [ "Mark Woods" ]
  s.has_rdoc          = false

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test}/*`.split("\n")
  # s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "activerecord"
  s.add_dependency "activesupport"
  s.add_development_dependency "bundler"
  s.add_development_dependency "fileutils"
  s.add_development_dependency "logger"
  s.add_development_dependency "minitest"
  s.add_development_dependency "mysql"
  s.add_development_dependency "mysql2"
  s.add_development_dependency "rake"
  s.add_developmnet_dependency "codeclimate-test-reporter"

  s.description       = <<desc
  A Rails plugin that adds methods to ActiveRecord::Migration to allow columns
  and indexes to be added to and removed from large tables with millions of
  rows in MySQL, without leaving processes seemingly stalled in state "copy
  to tmp table".
desc
end
