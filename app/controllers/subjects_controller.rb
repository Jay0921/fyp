class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[edit update destroy]

  def index
    @pagy, @subjects = pagy(Subject.all.order(:created_at))
  end

  def new
    @subject = Subject.new
  end

  def edit; end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to subjects_path, notice: 'Subject was successfully created.'
    else
      render :new
    end
  end

  def update
    if @subject.update(subject_params)
      redirect_to subjects_path, notice: 'Subject was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      redirect_to subjects_path, notice: 'Subject was successfully destroyed.'
    else
      redirect_to subjects_path, alert: @subject.errors.full_messages.join(', ')
    end
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name)
  end
end
