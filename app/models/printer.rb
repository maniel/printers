class Printer
  include DataMapper::Resource
  
  has n, :materials, :through => Resource
  
  property :id, Serial

  property :nazwa, String
  property :producent, String
  property :flaga, Flag[:laser, :kolor, :wielofunkcyjna]
  
  def laser?
    flaga.member? :laser
  end
  
  def kolor?
    flaga.member? :kolor
  end
  
  def wielofunkcyjna?
    flaga.member? :wielofunkcyjna
  end
  
end
