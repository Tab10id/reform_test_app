class PostCommitAction::Condition < ActiveRecord::Base
  attr_accessible :value, :invert

  def satisfied?
    invert? ? !condition : condition
  end

  private

  def condition
    # should implemented in children classes
  end
end