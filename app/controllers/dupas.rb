class Dupas < Application
  # provides :xml, :yaml, :js

  # GET /dupas
  def index
    @dupas = Dupa.all
    display @dupas
  end

  # GET /dupas/:id
  def show
    @dupa = Dupa[params[:id]]
    raise NotFound unless @dupa
    display @dupa
  end

  # GET /dupas/new
  def new
    only_provides :html
    @dupa = Dupa.new(params[:dupa])
    render
  end

  # POST /dupas
  def create
    @dupa = Dupa.new(params[:dupa])
    if @dupa.save
      redirect url(:dupa, @dupa)
    else
      render :new
    end
  end

  # GET /dupas/:id/edit
  def edit
    only_provides :html
    @dupa = Dupa[params[:id]]
    raise NotFound unless @dupa
    render
  end

  # PUT /dupas/:id
  def update
    @dupa = Dupa[params[:id]]
    raise NotFound unless @dupa
    if @dupa.update(params[:dupa])
      redirect url(:dupa, @dupa)
    else
      raise BadRequest
    end
  end

  # DELETE /dupas/:id
  def destroy
    @dupa = Dupa[params[:id]]
    raise NotFound unless @dupa
    if @dupa.destroy
      redirect url(:dupas)
    else
      raise BadRequest
    end
  end

end
