json.set! :rooms do
    json.array! @rooms do |room|
        json.extract! room, :id, :area, :genre, :artist, :date, :time, :comment
    end
end