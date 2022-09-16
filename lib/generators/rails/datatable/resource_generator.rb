# frozen_string_literal: true
module Rails
  module Datatable
    class ResourceGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../../../templates", __FILE__)

      desc "Registers resources with Rails::Datatable"

      def generate_config_file
        template "items_datatable.rb.erb", "app/datatables/#{file_path.tr('/', '_').pluralize}_datatable.rb"
        template "_item.html.erb", "app/views/#{file_path.tr('/', '_').pluralize}/_#{file_path.tr('/', '_')}.html.erb"
      end
    end
  end
end