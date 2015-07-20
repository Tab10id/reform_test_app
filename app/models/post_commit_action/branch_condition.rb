class PostCommitAction::BranchCondition < PostCommitAction::Condition
  private

  def condition
    current_branch == value
  end

  def current_branch
    # @todo: реализовать фактическую проверку бранча
    'master'
  end
end