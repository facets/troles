module Troles
  module Api
    module ClassMethods      
      #
      # When the Troles::Api is included by the Role Subject class (fx a User Account)
      # first include methods from Troles Common API      
      # then include Troles API on top
      #
      # @param [Class] the role subject class (fx User or UserAccount)
      #
      def included(base)
        base.send :include, Troles::Common::Api
        self.extend Troles::Common::Api::ClassMethods # draws in the #apis method from Common Api
        apis.each do |api|
          begin
            base.send :include, "Troles::Api::#{api.to_s.camelize}".constantize
            base.extend "Troles::Api::#{api.to_s.camelize}::ClassMethods".constantize
          rescue
          end
        end
      end      
    end
  end
end
