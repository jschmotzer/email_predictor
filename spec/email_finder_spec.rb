describe 'EmailFinder' do

  before :each do 
    @email_finder = EmailPredictor::EmailFinder.new('google.com')
  end

  context '#find_company_emails' do
    it 'returns all company emails matching the domain address' do
      expect(@email_finder.find_company_emails.count).to eq(2)
    end
  end

  context '#find_company_email_patterns' do
    it 'returns all possible email patterns for the company domain' do
      expect(@email_finder.find_company_email_patterns.count).to eq(2)
      expect(@email_finder.find_company_email_patterns).to eq([:first_name_dot_last_initial, :first_initial_dot_last_name])
    end  
  end

end