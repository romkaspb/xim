class StatusLog < ApplicationRecord
  include Statusable
  belongs_to :plane
end
