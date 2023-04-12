class GildedRose

  def initialize(items)
    @items = items
  end

  def update_brie(item)
    Brie.new(item).update
  end

  def update_sulfuras(item)
    Sulfuras.new(item).update
  end

  def update_backstage(item)
    Backstage.new(item).update
  end

  def update_standard(item)
    Standard.new(item).update
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

class Brie
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
    item.quality += 1 if item.quality < 50
    item.sell_in -= 1
  end
end

class Sulfuras
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
  end
end

class Backstage
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
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
end

class Standard
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
    item.quality -= 1 if item.quality > 0
    
    if item.sell_in < 0
      item.quality -= 1 if item.quality > 0
    end

    item.sell_in -= 1
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
