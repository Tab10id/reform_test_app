class PostCommitAction::ConditionGroupForm < Reform::Form
  include Concerns::Reform::NestedForm
  include Reform::Form::ModelReflections

  model 'post_commit_action/condition_group'
  property :cond_type
  # collection :condition_groups,
  #            form: PostCommitAction::ConditionGroupForm
  collection :conditions,
             form: PostCommitAction::ConditionForm,
             populate_if_empty: PostCommitAction::Condition
end