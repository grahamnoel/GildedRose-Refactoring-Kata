require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do

    let(:item) { Item.new(name, sell_in, quality) }
    let(:name) { "foo" }
    let(:sell_in) { 10 }
    let(:quality) { 9 }

    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq "foo"
    end

    it "decrements sell_in by 1" do
      items = [item]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 9
    end

    it "decrements quality by 1" do
      items = [item]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 8
    end

    context "past sell by day" do
      let(:sell_in) { -1 }

      it "decrements sell_in by 1" do
        items = [item]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq -2
      end

      it "decrements quality by 2" do
        items = [item]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 7
      end
    end

    context "quality at zero" do
      let(:quality) { 0 }

      it "does not go lower than zero" do
        items = [item]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 0
      end
    end

    context 'brie' do
      let(:name) { "Aged Brie" }

      it "decrements sell_in by 1" do
        items = [item]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq 9
      end

      it "increments quality by 1" do
        items = [item]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 10
      end

      context "and quantity at 50" do
        let(:quality) { 50 }

        it "does not go above 50" do
          items = [item]
          GildedRose.new(items).update_quality
          expect(items[0].quality).to eq 50
        end
      end
    end
  end
end
