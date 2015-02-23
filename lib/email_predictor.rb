require_relative 'email_predictor/importer'
require_relative 'email_predictor/advisor_importer'
require_relative 'email_predictor/email_address_parser'
require_relative 'email_predictor/email_finder'
require_relative 'email_predictor/email_builder'
require_relative 'email_predictor/email_predictor'

advisors = EmailPredictor::AdvisorImporter.new('lib/email_predictor/sample_data/advisors.csv')

#Imports sample data of advisors from csv and displays email recommendation
advisors.import_rows.each do |row|
  name = row[0]
  company_domain = row[1]
  advisor = EmailPredictor::EmailPredictor.new(name, company_domain)
  recommended_email = advisor.recommend_email_address
  advisor.show_recommendation(recommended_email)
end