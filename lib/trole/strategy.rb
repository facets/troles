module Trole
  module Strategy
    class GenericStorage
      attr_reader :api

      def initialize api
        @api = api
      end
      
      def valid_roles
        api.class.valid_roles
      end        

      def name
        :generic
      end
    end        
  end
end