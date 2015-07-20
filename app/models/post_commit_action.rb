class PostCommitAction < ActiveRecord::Base
  attr_accessible :description, :url, :repository_id

  has_one :condition_group,
          class_name: 'PostCommitAction::ConditionGroup' ,
          foreign_key: 'action_id',
          dependent: :destroy

  def start
    if condition_group.blank? || condition_group.satisfied?
      run
    end
  end

  def run
    # should be implemented in children classes
  end

  def to_s
    if description.present?
      "#{url} (#{description})"
    else
      url
    end
  end
end