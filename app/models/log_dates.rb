class LogDate
  include DataMapper::Resource
  
  property :id, Serial
  property :date, DateTime
  property :type, Discriminator
  belongs_to :material
end

class BookInDate < LogDate
end
class BookOutDate < LogDate
end
