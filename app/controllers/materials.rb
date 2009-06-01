class Materials < Application
  # provides :xml, :yaml, :js

  def index
    @materials = Material.all
    display @materials
  end

  def show(id)
    @material = Material.get(id)
    raise NotFound unless @material
    display @material
  end

  def new
    only_provides :html
    @material = Material.new
    display @material
  end

  def edit(id)
    only_provides :html
    @material = Material.get(id)
    raise NotFound unless @material
    display @material
  end

  def create(material)
    @material = Material.new(material)
    if @material.save
      redirect resource(@material), :message => {:notice => "Material was successfully created"}
    else
      message[:error] = "Material failed to be created"
      render :new
    end
  end

  def update(id, material)
    @material = Material.get(id)
    raise NotFound unless @material
    if @material.update_attributes(material)
       redirect resource(@material)
    else
      display @material, :edit
    end
  end

  def delete(id)
    @material = Material.get(id)
    raise NotFound unless @material
    if @material.destroy
      redirect resource(:materials)
    else
      raise InternalServerError
    end
  end

  def zmien_stan(id, ile, jak)
    @material = Material.get(id)
    raise NotFound unless @material
    case jak
    when "dodaj":
      @material.plus(ile.to_i)
      @material.save
      redirect resource(@material)
    when "zdejm":
      if ile.to_i > @material.stan
        redirect resource(@material), :message => {:error => "nie można zdjąć więcej niż jest na stanie!"}
      else
        @material.minus(ile.to_i)
        @material.save
        redirect resource(@material)
      end
    else
      raise 'cos namieszales:-)'
    end
  end

  def stats(poczatek = "01-01-2009", koniec = DateTime.now.strftime("%d-%m-%Y"))
    po,ko = DateTime.parse(poczatek),DateTime.parse(koniec)
    if po > ko
      redirect resource(:materials, :stats), :message => {:error => "'OD' nie może później niż 'DO'"}
    else
      @ary = []
      Material.all.each do |material|
        diff = material.book_out_dates.count(:date.in => po..ko+1)
        @ary << [material, diff]
      end
      display @ary
    end
  end

  def cofnij(id)
    @material = Material.get(id)
    raise NotFound unless @material
    if @material.book_out_dates.count == 0
      redirect resource(@material), :message => {:error => "już nie można cofnąć:-)"}
    else
      @material.book_out_dates.delete_at(-1)
      @material.save
      redirect resource(@material)
    end
  end
  
  def dodaj_drukarki(id, printersids)
    @material = Material.get(id)
    raise NotFound unless @material
    
    @material.printers.push(*Printer.all(:id.in => printersids))
    @material.save
  end
  
  def drukarki(id)
    @material = Material.get(id)
    raise NotFound unless @material
    if @material.typ == :tusz || @material.typ == :glowica
      @printers = Printer.all.find_all do |p|
        !p.laser?
      end
    elseif @material.typ == :toner || @material.typ == :beben
      @printers = Printer.all.find_all do |p|
        p.laser?
      end
    else
      @printers = Printer.all
    end
    display @material, @printers
  end

end # Materials
