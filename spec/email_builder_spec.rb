describe 'EmailBuilder' do

  before :each do 
    @email_builder = EmailPredictor::EmailBuilder.new('Grace Hopper', 'google.com', EmailPredictor::EmailAddressParser.new('Grace Hopper', 'google.com', :first_initial_dot_last_name))
  end

  context '#generate_email' do
    it 'generates an email address for a given pattern' do
      expect(@email_builder.generate_email).to eq('g.hopper@google.com')
    end
  end

end