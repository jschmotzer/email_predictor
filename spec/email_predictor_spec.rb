describe 'EmailPredictor' do

  before :each do 
    @email_predictor = EmailPredictor::EmailPredictor.new('Grace Hopper', 'google.com')
  end

  context '#recommend_email_address' do
    it 'recommends an email address for the advisor' do
      expect(@email_predictor.recommend_email_address).to eq(['grace.h@google.com', 'g.hopper@google.com'])
    end
  end

end