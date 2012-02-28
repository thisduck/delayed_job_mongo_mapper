# encoding: utf-8
require 'mongo_mapper'
require 'delayed_job'
if YAML.parser.class.name !~ /syck/i
  require 'delayed/psych_ext_mongo_mapper'
end
require 'delayed/serialization/mongo_mapper'
require 'delayed/backend/mongo_mapper'

Delayed::Worker.backend = :mongo_mapper
