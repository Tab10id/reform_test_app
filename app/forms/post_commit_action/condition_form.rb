class PostCommitAction::ConditionForm < Reform::Form
  include Concerns::Reform::NestedForm

  model 'post_commit_action/condition'
  property :condition_type
  property :invert
  property :value

  validates :value, presence: true
end