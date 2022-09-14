require "rails/datatable/version"

module Rails
  module Datatable
    class Error < StandardError; end
    # Your code goes here...

    class Base
    	def run
    		return true
    	end
    end
  end
end
