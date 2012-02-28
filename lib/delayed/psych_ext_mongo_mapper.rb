module Psych
  module Visitors
    class ToRuby
      def visit_Psych_Nodes_Mapping_with_klass(object)
        return revive(Psych.load_tags[object.tag], object) if Psych.load_tags[object.tag]

        case object.tag
        when /^!ruby\/MongoMapper:(.+)$/
          klass = resolve_class($1)
          payload = Hash[*object.children.map { |c| accept c }]
          begin
            klass.find!(payload["attributes"]["_id"])
          rescue MongoMapper::DocumentNotFound
            raise Delayed::DeserializationError
          end
        else
          visit_Psych_Nodes_Mapping_without_klass(object)
        end
      end
      alias_method_chain :visit_Psych_Nodes_Mapping, :klass
    end
  end
end
