require_relative "../lib/email_predictor"

advisors = EmailPredictor::AdvisorImporter.new('lib/email_predictor/sample_data/advisors.csv')

advisors.import_rows.each do |row|
  name = row[0]
  company_domain = row[1]
  advisor = EmailPredictor::EmailPredictor.new(name, company_domain)
  advisor.recommend_email_address
end