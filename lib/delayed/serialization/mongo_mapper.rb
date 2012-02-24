# encoding: utf-8
if YAML.parser.class.name =~ /syck/i
  MongoMapper::Document.class_eval do
    @attributes_delayed = nil
    yaml_as "tag:ruby.yaml.org,2002:MongoMapper"

    def self.yaml_new(klass, tag, val)
      val['attributes'] = val['attributes_delayed']
      begin
        klass.find!(val['attributes']['_id'])
      rescue MongoMapper::DocumentNotFound
        raise Delayed::DeserializationError
      end
    end

    def to_yaml_properties
      @attributes_delayed = self.attributes
      ['@attributes_delayed']
    end
  end
else
  MongoMapper::Document.class_eval do
    def encode_with(coder)
      coder["attributes"] = self.attributes
      coder.tag = ['!ruby/MongoMapper', self.class.name].join(':')
    end
  end
end
