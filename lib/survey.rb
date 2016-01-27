class Survey < ActiveRecord::Base
  has_many :questions
  before_save(:capitalized)

  private

  def capitalized
    self.title = self.title.titleize
  end
end
