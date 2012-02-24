# delayed_job MongoMapper backend

## Installation

Add the gems to your Gemfile:

    gem 'delayed_job'
    gem 'delayed_job_mongo_mapper' => :git => "git://github.com/thisduck/delayed_job_mongo_mapper.git"

After running `bundle install`, create the indexes (and don't forget to do this on your production database):

    rails runner 'Delayed::Backend::MongoMapper::Job.create_indexes'

That's it. Use [delayed_job as normal](http://github.com/collectiveidea/delayed_job).

## From

This is forked and modified from [delayed_job_mongoid](https://github.com/collectiveidea/delayed_job_mongoid).
