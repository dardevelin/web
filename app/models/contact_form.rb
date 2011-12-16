class ContactForm < MailForm::Base
  @@services = [ :rush, :kickstart, :code_review ]
  @@start_times = [ :immediately, :month, :months ]

  attribute :name,       validate: true
  attribute :email,      validate: /[^@]+@[^\.]+\.[\w\.\-]+/
  attribute :message,    validate: true

  append :remote_ip, :user_agent, :session

  cattr_reader :services
  cattr_reader :start_times

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Codegram contact form",
      :to => "info@codegram.com",
      :from => %("Codegram Mailer <info@codegram.com>)
    }
  end


  def self.localized_services
    localize_array(:services, @@services)
  end

  def self.localized_start_times
    localize_array(:start_times, @@start_times)
  end

  def self.localize_array(scope, array)
    array.collect do |e|
      if e.is_a? Array
        localize_array(scope, e)
      else
        I18n.t("#{scope}.#{e}")
      end
    end
  end

  attribute :service,    validate: localized_services.map { |services| services.last }.flatten
  attribute :start_time, validate: localized_start_times

end
