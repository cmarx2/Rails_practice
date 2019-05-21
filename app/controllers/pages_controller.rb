class PagesController < ApplicationController
  
  #shows all of the pages
  #Read
  def index
    @pages = Page.all
    # render index.html.erb
  end

  #show a single page
  #Read
  def show
    @page = Page.find(params[:id])
  end
  #render show.html.erb

  #shows the create form
  #new page in memory
  def new
    @page = Page.new
  end
  #render new.html.erb

  #POST
  # try to add on to the database
  def create
    @page = Page.new(pages_params)

    if @page.save #catch errors
      redirect_to pages_path
    else
      render :new
    end
  end

  #shows the edit form
  def edit
      @page = Page.find(params[:id])
      #edit.html.erb
  end

  def update
    @page = Page.find(params[:id])
    
    if @page.update(pages_params)
        redirect_to pages_path
    else
      render :edit
    end
  end

  def destroy
    Page.find(params[:id]).destroy
    redirect_to pages_path
  end

  private

    def pages_params
      params.require(:page).permit(:title, :author, :body)
    end
end
