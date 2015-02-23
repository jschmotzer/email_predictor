module EmailPredictor

  class AdvisorImporter < Importer

    def initialize(csv_filename)
      @csv_filename = csv_filename
    end

    def extract_name(row)
      row[0]
    end

    def extract_company(row)
      row[1]
    end

    
    #maybe have a method that suggests email after importing row here with an options in initialize to predict

    # private

    # def transform_row
    #   import_rows.flatten
    # end

  
  end  

end