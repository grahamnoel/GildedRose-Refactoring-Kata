class GildedRose

  def initialize(items)
    @items = items
  end

  def klass_for(name)
    case name
    when "Aged Brie"
      Brie
    when "Sulfuras, Hand of Ragnaros"
      Sulfuras
    when "Backstage passes to a TAFKAL80ETC concert"
      Backstage
    else
      Standard
    end
  end

  def update_quality()
    @items.each do |item|
      klass_for(item.name).new(item).update
    end
  end
end

class BaseItem
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
  end
end

class Brie < BaseItem
  def update
    item.quality += 1 if item.quality < 50
    item.sell_in -= 1
  end
end

class Sulfuras < BaseItem
end

class Backstage < BaseItem
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

class Standard < BaseItem
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
