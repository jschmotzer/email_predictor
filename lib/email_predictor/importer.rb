require 'csv'
require 'byebug'

module EmailPredictor

  class Importer
  
    def initialize(csv_filename)
      @csv_filename = csv_filename
    end

    def import_rows
      CSV.readlines(@csv_filename)
    end

  end
end