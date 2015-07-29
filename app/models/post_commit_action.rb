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

  def action_type=(action_type)
    model_type = "post_commit_action/#{action_type}_action".camelize
    model_type.constantize # Проверяем наличие соответствующего класса
    self.type = model_type
  end

  def action_type
    type.present? ? type.gsub(/^PostCommitAction::/, '').gsub(/Action$/, '').underscore : 'jenkins'
  end
end