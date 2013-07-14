require 'spec_helper'

describe Rubylike::Color do
	it "should return proper red-values" do
		Rubylike::Colors::red.red.should eq 255
		Rubylike::Colors::green.red.should eq 0
		Rubylike::Colors::blue.red.should eq 0
	end

	it "should return proper green-values" do
		Rubylike::Colors::red.green.should eq 0
		Rubylike::Colors::green.green.should eq 255
		Rubylike::Colors::blue.green.should eq 0
	end

	it "should return proper blue-values" do
		Rubylike::Colors::red.blue.should eq 0
		Rubylike::Colors::green.blue.should eq 0
		Rubylike::Colors::blue.blue.should eq 255
	end

	it "should add two colors accordingly" do
		c = Rubylike::Colors::red + Rubylike::Colors::blue
		c.red.should be 255
		c.blue.should be 255
		c.green.should be 0
	end

	it "should subtract two colors accordingly" do
		c = Rubylike::Colors::red - Rubylike::Colors::red
		c.red.should be 0
		c.green.should be 0
		c.blue.should be 0
	end

	it "should multiply two colors accordingly" do
		c = Rubylike::Colors::grey * Rubylike::Colors::red
		c.red.should be 127
		c.green.should be 0
		c.blue.should be 0
	end

	it "should multiply a color with a float" do
		c = Rubylike::Colors::red ** 0.5
		c.red.should be 127
		c.green.should be 0
		c.blue.should be 0
	end

	it "should be possible to define own colors" do
		c = Rubylike::Color.create(255, 127, 0)
		c.class.should eq Rubylike::Color
		c.red.should eq 255
		c.green.should eq 127
		c.blue.should eq 0
	end
end
