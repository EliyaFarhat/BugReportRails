class BugReportsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_bug_report, except: [:index, :new, :create] # only: [:show, :edit, :update, :destroy]
    def index
        @bug_reports = BugReport.all
    end

    def show
    end

    def new
        @bug_report = BugReport.new
    end

    def create
        @bug_report = BugReport.new(bug_report_params)
        if @bug_report.save
            redirect_to @bug_report, notice: "Bug report created successfully!"

        else
            render :new, status: :unprocessable_entity
        end

    end

    def edit

    end

    def update
        if @bug_report.update(bug_report_params)
            redirect_to @bug_report, notice: "Bug report updated successfully!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @bug_report.destroy
        redirect_to root_path, notice: "Bug report deleted successfully!"
    end

    private

    def bug_report_params
        params.require(:bug_report).permit(:title, :summary)
    end

    def set_bug_report
        @bug_report = BugReport.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end
end
