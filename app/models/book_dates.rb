class BookInDate
include DataMapper::Resource
property :id, Serial
property :date, DateTime
end
class BookOutDate
include DataMapper::Resource
property :id, Serial
property :date, DateTime
end
