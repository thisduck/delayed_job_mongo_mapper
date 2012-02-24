# encoding: utf-8
require 'mongo_mapper'
require 'delayed_job'
require 'delayed/psych_ext_mongo_mapper'
require 'delayed/serialization/mongo_mapper'
require 'delayed/backend/mongo_mapper'

Delayed::Worker.backend = :mongo_mapper
