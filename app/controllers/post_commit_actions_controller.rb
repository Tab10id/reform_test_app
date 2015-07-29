class PostCommitActionsController < ApplicationController
  before_filter :form_for_new_action, only: %w(new create)
  before_filter :form_for_existed_action, only: %w(edit update)

  def new
    @form.prepopulate!
  end

  def create
    if @form.validate(params[:post_commit_action])
      @form.save
      redirect_to post_commit_actions_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @form.validate(params[:post_commit_action])
      @form.save
      redirect_to post_commit_actions_path
    else
      render 'edit'
    end
  end

  def index
    @actions = PostCommitAction.all
  end

  def destroy
    @action = find_action(params[:id])
    if @action.present?
      @action.destroy
      redirect_to post_commit_actions_path
    end
  end

  private

  def form_for_new_action
    @form = PostCommitActionForm.new(PostCommitAction.new)
  end

  def form_for_existed_action
    @form = PostCommitActionForm.new(find_action(params[:id]))
  end

  def find_action(id)
    PostCommitAction.find(id)
  end
end