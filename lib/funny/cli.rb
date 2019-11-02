require 'thor'
require 'caracal'
require 'active_record'
module Funny
  class CLI < Thor

    desc 'generate method', 'generates a Microsoft Word document(.docx)'
    method_option :environment, aliases: "-env"
    def generate
      puts 'generate a word'
      docx = Caracal::Document.new('database_metadata.docx')
      @environment = options[:environment] || 'development'
      finished_data = collect_data docx
      finished_data.save
    end

    private

    def connection
      # @conn = ActiveRecord::Base.connection
      connection_pool = ActiveRecord::Base.establish_connection YAML::load(File.open('config/database.yml'))[@environment]
      connection_pool.connection
    end

    def filter_table_names
      %w[ar_internal_metadata schema_migrations spatial_ref_sys]
    end

    def discovered_tables
      connection.tables.reject { |name| filter_table_names.include?(name) }.sort
    end

    def model_name_from_table(table_name)
      table_name.singularize.underscore.classify.constantize
    end

    def table_metadata(table_name, rows)
      @columns = connection.columns(table_name)
      @columns.each do |column|
        rows << [column.name, column.type, column.comment, column.default, column.geographic, column.null]
      end
      rows
    end

    def collect_data(docx)
      discovered_tables.each_with_index do |table_name, index|
        rows = []
        docx.h1 "#{index+1}.#{table_name}"
        rows << %w[field type comment default_value geographic allow_null]
        rows = table_metadata(table_name, rows)
        next unless rows.present?
        docx.table rows , border_size: 4 do
          cell_style cells, size: 18, margins: { top: 100, bottom: 0, left: 100, right: 100 }
        end
      end
      docx
    end

  end
end
