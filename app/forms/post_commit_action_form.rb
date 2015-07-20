class PostCommitActionForm < Reform::Form
  include Reform::Form::ModelReflections

  property :condition_group,
           prepopulator: :prepopulate_condition_group!,
           populate_if_empty: PostCommitAction::ConditionGroup,
           form: PostCommitAction::ConditionGroupForm

  private

  def prepopulate_condition_group!(options)
    self.condition_group = PostCommitAction::ConditionGroup.new(cond_type: (options[:cond_type] || 'and'))
  end
end