class PostCommitAction::JenkinsAction < PostCommitAction
  def run
    `curl #{url}`
  end

  def to_s
    "#{l(:jenkins, scope: 'post_commit_actions.action_types')}: #{super}"
  end
end