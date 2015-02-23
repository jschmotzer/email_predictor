module EmailPredictor

  class EmailPredictor
    attr_reader :advisor_name, :company_domain, :email_finder
    
    def initialize(advisor_name, company_domain)
      @advisor_name = advisor_name
      @company_domain = company_domain 
    end

    def recommend_email_address
      email_address_patterns = email_finder.find_company_email_patterns

      recommended_email_address = email_address_patterns.map do |pattern|
        email = EmailBuilder.new(advisor_name, company_domain, EmailAddressParser.new(advisor_name, company_domain, pattern))
        email.generate_email
      end
      show_recommendation(recommended_email_address)
    end

    def show_recommendation(recommended_email_address)
      if recommended_email_address.any?
        puts "The predicted email address for #{advisor_name}: #{recommended_email_address.join(', ')}"
      else
        puts "No email addresses found for #{advisor_name} based on the domain name #{company_domain}"
      end  
    end

    private

    def email_finder
      @email_finder ||= EmailFinder.new(company_domain)
    end

  end
end