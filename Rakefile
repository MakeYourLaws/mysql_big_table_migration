require 'rake'
require 'rake/testtask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the mysql_big_table_migration plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/*_test.rb'
  t.verbose = true
end

Bundler::GemHelper.install_tasks
Dir.glob('tasks/*.rake').each { |r| import r }
