require 'rails/generators'

module Rails
  module Datatable
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../templates", __FILE__)

      def init_datatable
        empty_directory 'app/datatables'
        template "datatable.rb", "app/datatables/datatable.rb"
      end

      def insert_jquery_datatable_js
        insert_into_file(
          'app/assets/javascripts/application.js',
          "\n//= require jquery\n//= require jquery.dataTables.min"
        )
      end
    end
  end
end