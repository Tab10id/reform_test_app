class PostCommitAction::Condition < ActiveRecord::Base
  attr_accessible :value, :invert

  def satisfied?
    invert? ? !condition : condition
  end

  def condition_type=(condition_type)
    model_type = "post_commit_action/#{condition_type}_condition".camelize
    model_type.constantize # Проверяем наличие соответствующего класса
    self.type = model_type
  end

  def condition_type
    type.present? ? type.gsub(/^PostCommitAction::/, '').gsub(/Condition$/, '').underscore : 'path'
  end

  private

  def condition
    # should implemented in children classes
  end
end