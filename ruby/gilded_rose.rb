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

class Conjured < BaseItem
  def update
    2.times do
      item.quality -= 1 if item.quality > 0
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
class GildedRose

  DEFAULT_ITEM = Standard
  SPECIAL_ITEMS = {
    "Aged Brie" => Brie,
    "Sulfuras, Hand of Ragnaros" => Sulfuras,
    "Backstage passes to a TAFKAL80ETC concert" => Backstage,
    "Conjured Mana Cake" => Conjured
  }

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      wrapped_item = (SPECIAL_ITEMS[item.name] || DEFAULT_ITEM).new(item)
      wrapped_item.update
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
