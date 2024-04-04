class CommentsController < ApplicationController
  def create
    @bug_report = BugReport.find(params[:bug_report_id])
  @comment = @bug_report.comments.new(comment_params)
  @comment.user = current_user

  if @comment.save
    redirect_to @bug_report, notice: "Comment was successfully created."
  else
    redirect_to @bug_report, alert: "Comment can't be blank."
  end
  end

  private

  def comment_params

    params.require(:comment).permit(:content).merge(bug_report_id: params[:bug_report_id])
  end
end
