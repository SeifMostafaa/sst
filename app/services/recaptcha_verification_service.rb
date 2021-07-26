class RecaptchaVerificationService < ApplicationService
  include ActiveModel::Model

  attr_reader(
    :recaptcha_response,
    :client_ip_address
  )

  def initialize(recaptcha_response, client_ip_address)
    @recaptcha_response = recaptcha_response
    @client_ip_address = client_ip_address
  end

  def call
    recaptcha_result = verify_recaptcha
    return fail(recaptcha_result['error-codes']) unless recaptcha_result['success']

    success
  end

  private

  def verify_recaptcha
    HTTParty.post('https://www.google.com/recaptcha/api/siteverify',
                  body: {
                    secret: '6LdfaXwbAAAAAD46K1SI52YWMD4JMIL0dfe6Rjec',
                    response: @recaptcha_response,
                    remoteip: @client_ip_address
                  },
                  headers: { "Content-Type": 'application/x-www-form-urlencoded' })
  end
end
