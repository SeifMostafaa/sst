class ApplicationService
  extend ActiveSupport::Concern

  def self.call(*args, &block)
    new(*args, &block).call
  end

  def fail(error)
    ServiceResult.new(success: false, response: { error: error })
  end

  def success(args = {})
    ServiceResult.new(success: true, response: args)
  end

  class Error < StandardError
  end
end
