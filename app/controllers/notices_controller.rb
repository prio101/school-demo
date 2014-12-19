class NoticesController < ApplicationController

def index
  @notices = Notice.all
end

def new
  @notice = Notice.new
end

def create
  @notice = Notice.new(notice_params)
  if @notice.save
    flash[:notice] = 'Notice was successfully created.'
    redirect_to :action => 'index'
  else
    render :action => 'new'
  end

end

def show
  @notice = Notice.find(params[:id]);
end

def edit
  @notice = Notice.find(params[:id])
end

def update
  @notice = Notice.find(params[:id])
  if @notice.update_attributes(notice_params)
    flash[:notice] = 'Notice was successfully updated.'
    redirect_to :action => 'show', :id => @notice
  else
    render :action => 'edit'
  end
end

def delete
  Notice.find(params[:id]).destroy
  redirect_to :action => 'index'
end

private

def notice_params

  params.require(:notice).permit(:title, :description)

end


end
