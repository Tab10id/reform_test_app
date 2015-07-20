class PostCommitAction::ConditionForm < Reform::Form
  model 'post_commit_action/condition'
  property :condition_type, virtual: true
  property :invert
  property :value

  validates :value, presence: true

  delegates :validator, :validators_on
end