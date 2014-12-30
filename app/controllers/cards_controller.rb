class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :delete]
  before_filter :authenticate_user!
  # before_filter :set_student

  def index
    @cards = Card.all
  end

  def show

  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to [@student, @card], notice: 'Student card was successfully created.' }
        format.json { render action: 'show', status: :created, location: @card }
      else
        raise @card.errors.inspect
        format.html { render action: 'new' }
        format.json { render json: @card.errors, status: :unprocessable_entity }

      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'Card schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    # @card = card.find_by_student_id(@student.id)
  end

  def destroy
    # @card = card.find_by_student_id(@student.id)
    @card.destroy
    respond_to do |format|
      flash.now[:error] = "card record deleted"
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

  private

  # def set_student
  #   if params[:student_id].blank?
  #     respond_to do |format|
  #       format.html {redirect_to request.referer , notice: 'You have to provide student id.'}
  #     end
  #   end
  #   @student = Student.find(params[:student_id])
  # end

  def set_card
    @card = card.find(params['id'])
  end

  def card_params
    params.require(:card).permit!
  end

end
