class GildedRose

  def initialize(items)
    @items = items
  end

  def update_brie(item)
    item.quality += 1 if item.quality < 50
    item.sell_in -= 1
  end

  def update_sulfuras(item)
  end

  def update_backstage(item)
    item.quality += 1 if item.quality < 50

    if item.sell_in < 11
      item.quality += 1 if item.quality < 50
    end

    if item.sell_in < 6
      item.quality += 1 if item.quality < 50
    end

    if item.sell_in < 0
      item.quality = 0
    end

    item.sell_in -= 1
  end

  def update_standard(item)
    item.quality -= 1 if item.quality > 0
    
    if item.sell_in < 0
      item.quality -= 1 if item.quality > 0
    end

    item.sell_in -= 1
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when "Aged Brie"
        return update_brie(item)
      when "Sulfuras, Hand of Ragnaros"
        return update_sulfuras(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        return update_backstage(item)
      else
        return update_standard(item)
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
