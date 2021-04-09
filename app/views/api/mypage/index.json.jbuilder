json.set! :profiles do
    json.array! @profiles do |profile|
        json.extract! profile,  :area, :sex, :living, :height, :look, :type, :holiday, :smoke, :drink, :detail
    end
end