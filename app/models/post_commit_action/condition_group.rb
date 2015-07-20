class PostCommitAction::ConditionGroup < ActiveRecord::Base
  attr_accessible :cond_type

  has_many :condition_groups,
           class_name: 'ConditionGroup',
           foreign_key: 'parent_id',
           dependent: :destroy
  has_many :conditions,
           class_name: 'Condition',
           dependent: :destroy
  belongs_to :parent,
             class_name: 'ConditionGroup'
  belongs_to :action,
             class_name: 'PostCommitAction'

  accepts_nested_attributes_for :condition_groups
  accepts_nested_attributes_for :conditions

  def satisfied?
    if cond_type == 'and'
      condition_groups.all?(&:satisfied?) && conditions.all?(&:satisfied?)
    else
      condition_groups.any?(&:satisfied?) || conditions.any?(&:satisfied?)
    end
  end
end