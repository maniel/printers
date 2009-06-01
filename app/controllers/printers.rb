class Printers < Application
  # provides :xml, :yaml, :js

  def index
    @printers = Printer.all
    display @printers
  end

  def show(id)
    @printer = Printer.get(id)
    raise NotFound unless @printer
    display @printer
  end

  def new
    only_provides :html
    @printer = Printer.new
    display @printer
  end

  def edit(id)
    only_provides :html
    @printer = Printer.get(id)
    raise NotFound unless @printer
    display @printer
  end

  def create(printer)
    @printer = Printer.new(printer)
    if @printer.save
      redirect resource(@printer), :message => {:notice => "Printer was successfully created"}
    else
      message[:error] = "Printer failed to be created"
      render :new
    end
  end

  def update(id, printer)
    @printer = Printer.get(id)
    raise NotFound unless @printer
    if @printer.update_attributes(printer)
       redirect resource(@printer)
    else
      display @printer, :edit
    end
  end

  def destroy(id)
    @printer = Printer.get(id)
    raise NotFound unless @printer
    if @printer.destroy
      redirect resource(:printers)
    else
      raise InternalServerError
    end
  end

  def materialy(id)
    @printer = Printer.get(id)
    raise NotFound unless @printer
  end

  def dodaj_materialy(id, materials=[])
    @printer = Printer.get(id)
    raise NotFound unless @printer
  end

end # Printers
