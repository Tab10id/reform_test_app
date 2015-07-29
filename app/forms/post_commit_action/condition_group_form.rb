class PostCommitAction::ConditionGroupForm < Reform::Form
  include Concerns::Reform::NestedForm
  include Reform::Form::ModelReflections

  model 'post_commit_action/condition_group'
  property :cond_type
  # collection :condition_groups,
  #            form: PostCommitAction::ConditionGroupForm
  collection :conditions,
             form: PostCommitAction::ConditionForm,
             populate_if_empty: PostCommitAction::Condition,
             skip_if: :skip_condition?

  private

  def skip_condition?(fragment, _)
    if fragment['_destroy'] == '1'
      conditions.find{ |c| c.id.to_s == fragment['id'] }.mark_for_destruction
    end
  end
end