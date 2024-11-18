class Board < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :width, :height, :mines, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :max_mines

  private

  def max_mines
    if width.present? && height.present? && mines.present?
      errors.add(:mines, "can't be greater than the number of cells (#{width * height})") if mines > width * height
    end
  end
end
