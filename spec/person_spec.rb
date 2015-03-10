describe 'Person' do 

  before :each do
    @person = EmailPredictor::Person.new('John Smith')
  end

  describe '#first_name' do
    it 'finds the first name in a persons full name' do
      expect(@person.first_name).to eq('John')
    end
  end

  describe '#last_name' do

    it 'finds the last name in a persons full name' do
      expect(@person.last_name).to eq('Smith')
    end
  end

  describe '#first_initial' do

    it 'finds the first inital in a persons full name' do
      expect(@person.first_initial).to eq('J')
    end

  end

  describe '#last_initial' do

    it 'finds the last inital in a persons full name' do
      expect(@person.last_initial).to eq('S')
    end
  end

end