describe 'EmailAddressParser' do

  before :each do 
    @parser = EmailPredictor::EmailAddressParser.new('Grace Hopper', 'grace.hopper@test.com')
    @person = EmailPredictor::Person.new('Grace Hopper')
  end

  context '#find_email_pattern' do
    it 'finds the correct email pattern' do
      pattern1 = EmailPredictor::EmailAddressParser.new('John Smith', 'john.s@test.com')
      pattern2 = EmailPredictor::EmailAddressParser.new('John Smith', 'j.smith@test.com')
      pattern3 = EmailPredictor::EmailAddressParser.new('John Smith', 'j.s@test.com')
      
      expect(@parser.find_email_pattern).to eq(:first_name_dot_last_name)
      expect(pattern1.find_email_pattern).to eq(:first_name_dot_last_initial)
      expect(pattern2.find_email_pattern).to eq(:first_initial_dot_last_name)
      expect(pattern3.find_email_pattern).to eq(:first_initial_dot_last_initial)
    end
  end

  context 'parses a name with the correct email pattern' do
    it '#first_name_dot_last_name' do
      expect(@parser.first_name_dot_last_name(@person)).to eq('grace.hopper')
    end

    it '#first_name_dot_last_initial' do
      expect(@parser.first_name_dot_last_initial(@person)).to eq('grace.h')
    end

    it '#first_initial_dot_last_name' do
      expect(@parser.first_initial_dot_last_name(@person)).to eq('g.hopper')
    end

    it '#first_initial_dot_last_initial' do
      expect(@parser.first_initial_dot_last_initial(@person)).to eq('g.h')
    end
  end

end