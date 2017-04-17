require "mc_donald"

describe "#poor_calories_counter" do

  it "should compute number of calories" do
    expect(poor_calories_counter("Big Mac", "French Fries", "Coca")).to eq(590)
  end

end

describe "#calories_counter" do

  it "should compute number of calories" do
    expect(calories_counter(["Big Mac", "French Fries", "Happy Meal", "Coca"])).to eq(1170)
  end

end
