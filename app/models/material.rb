class Material
  include DataMapper::Resource
  
  has n, :printers, :through => Resource

  has n, :book_in_dates
  has n, :book_out_dates
  
  property :id, Serial
  property :nazwa, String
  property :typ, Enum[:glowica, :tusz, :toner, :beben, :inny]
  
  validates_format :nazwa, :with => /./, :message =>  "błont!"

  def plus(ile)
    ile.times do
      book_in_dates << BookInDate.new(:date => DateTime.now)
    end
    Merb.logger.info("dodano "+ile.to_s+" sztuk do stanu")
  end

  def minus(ile)
    ile.times do
      book_out_dates << BookOutDate.new(:date => DateTime.now)
    end
    Merb.logger.info("zdjeto "+ile.to_s+" sztuk ze stanu")
  end

  def stan
    book_in_dates.count -  book_out_dates.count
  end
end
