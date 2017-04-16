module Statusable
   extend ActiveSupport::Concern

  included do
    enum status: [:shed, :waiting, :flewout]
  end
end
