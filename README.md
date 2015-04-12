[![Build Status](https://travis-ci.org/MakeYourLaws/mysql_big_table_migration.svg)](https://travis-ci.org/MakeYourLaws/mysql_big_table_migration) [![Gem Version](https://badge.fury.io/rb/mysql_big_table_migration.svg)](http://badge.fury.io/rb/mysql_big_table_migration)

MysqlBigTableMigration
======================

A Rails plugin that adds methods to ActiveRecord::Migration to allow columns
and indexes to be added to and removed from large tables with millions of
rows in MySQL, without leaving processes seemingly stalled in state "copy
to tmp table".

For each of the standard transformations that operate on columns or indexes,
this plugin adds a "using_tmp_table" version. These methods create a
temporary table with the same structure as the table to be altered, applies
the transformation to the temp table, copies data from the source table to
the temp table and then replaces the source table with the temporary one.

While it does try to ensure that data is consistent at the end of the entire
process by locking tables and looking for rows created or modified during
copying, this is NOT TRANSACTION SAFE as it (a) relies on timestamp columns
and (b) doesn't handle rows that have been deleted from the source table
after being copied to the temporary table.

Installation
============

	source 'https://rubygems.org' do
	  ...
	  gem 'mysql_big_table_migration'
	  ...
	end


Example
=======


	class AddIndexOnSomeColumnToSomeTable < ActiveRecord::Migration
	  def self.up
	    add_index_using_tmp_table :some_table, :some_column
	  end

	  def self.down
	    remove_index_using_tmp_table :some_table, :some_column
	  end
	end

	class MungeOtherTable < ActiveRecord::Migration
	  def change
	    with_tmp_table :some_table do |t|
	      remove_column t, :boring_data
	      remove_index t, name: :index_some_table_on_useful_data_and_boring_data
	      add_column t, :other_id, :integer
	      change_column t, :comment, :string, limit: 140
	      add_index t, :other_id, unique: true, name: :idx_other_id
	    end
	  end
	end


Copyright (c) 2010 Mark Woods, released under the MIT license

Testing
========

You will need to bundle install dependencies for the project, as well as create a test database. To install dependencies run `bundle install`. To create the database run the following in a MySQL prompt as an admin user:

	CREATE DATABASE mysql_big_table_migration_test;
	GRANT ALL PRIVILEGES ON mysql_big_table_migration_test.* TO 'travis'@'localhost';

After bundling dependencies, and setting up the test database, run the tests with `rake test`
