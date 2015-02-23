module EmailPredictor

  class EmailFinder
    attr_accessor :all_company_emails, :company_domain

    EMAIL_SAMPLES = {
      "John Ferguson" => "john.ferguson@alphasights.com",
      "Damon Aw" => "damon.aw@alphasights.com",
      "Linda Li" => "linda.li@alphasights.com",
      "Larry Page" => "larry.p@google.com",
      "Sergey Brin" => "s.brin@google.com",
      "Steve Jobs" => "s.j@apple.com"
    }

    def initialize(company_domain)
      @company_domain = company_domain
      @all_company_emails = {}
    end

    #Finds all company emails stored from a given domain address
    def find_company_emails
      EMAIL_SAMPLES.each do |name, email|
        all_company_emails[name] = email if match_company_domain?(email)
      end
      all_company_emails
    end

    #Parses all stored company emails to find unique email patterns
    def find_company_email_patterns
      #Could be a performance issue if there are a lot of emails to iterate through.
      #Maybe limit the sample size
      find_company_emails
      all_company_emails.map do |name, email|
        email_address_parser(name, email).find_email_pattern
      end.uniq
    end

    def match_company_domain?(email)
      find_domain_name(email) == company_domain
    end

    def find_domain_name(email)
      email.split('@').last
    end

    private

    def email_address_parser(name, email_address)
      @email_address_parser = EmailAddressParser.new(name, email_address)
    end

  end
end