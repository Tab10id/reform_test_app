class PostCommitActionForm < Reform::Form
  include Reform::Form::ModelReflections
  include Reform::Form::Lotus

  property :action_type, virtual: true
  property :description
  property :url
  property :repository_id
  property :condition_group,
           prepopulator: :prepopulate_condition_group!,
           populate_if_empty: PostCommitAction::ConditionGroup,
           form: PostCommitAction::ConditionGroupForm

  delegates :validator, :validators_on

  private

  def prepopulate_condition_group!(options)
    self.condition_group = PostCommitAction::ConditionGroup.new(cond_type: (options[:cond_type] || 'and'))
  end
end