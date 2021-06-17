class ServiceResult < OpenStruct
  def initialize(success:, response:)
    super(success?: success, response: response)
  end

  def error
    return if success?

    response[:error]
  end

  def error_response(_status = 400)
    return if success?

    {
      'errors': [
        {
          'message': response[:error]
        }
      ],
      'status': 400
    }
  end
end
