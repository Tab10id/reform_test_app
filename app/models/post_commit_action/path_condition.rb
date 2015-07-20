class PostCommitAction::PathCondition < PostCommitAction::Condition
  private

  def condition
    paths.include?(value)
  end

  def paths
    # @todo: реализовать фактическое получение путей коммита
    %w(development development/init.rb)
  end
end