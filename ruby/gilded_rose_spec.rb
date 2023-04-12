require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "decrements sell_in by 1" do
      items = [Item.new("foo", 10, 9)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
    end

    it "decrements quality by 1" do
      items = [Item.new("foo", 10, 9)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 8
    end
  end

end
