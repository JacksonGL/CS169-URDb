require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "name" do
    let(:rating) { 5.0 }

    it "should not be nil" do
      expect {
        Movie.create!(:rating => rating)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not be blank" do
      expect {
        Movie.create!(:name => '', :rating => rating)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "ratings" do
    let(:movie_name) { 'It\'s a Wonderful Life' }
    let(:rating) { 5.0 }

    it "can be a valid decimal" do
      expect {
        Movie.create!(:name => movie_name, :rating => rating)
      }.not_to raise_error
    end

    it "should not be greater than 10" do
      expect {
        Movie.create!(:name => movie_name, :rating => 10.1)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not be less than 0" do
      expect {
        Movie.create!(:name => movie_name, :rating => -0.1)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "from Paramount" do
    let(:movies_paramount) do
      movies = [
        {:name => 'Star Trek', :rating => 8.0},
        {:name => 'The Wolf of Wall Street', :rating => 9.2}
      ]
      movies.map { |m| Movie.new(m) }
    end

    it "should return a valid list of movies" do
      # Movie.stub(:from_paramount) { movies_paramount }
      allow(Movie).to receive(:from_paramount).and_return(movies_paramount)
      movies = Movie.from_paramount
      movies.each do |movie|
        expect(movie).to be_a(Movie)
      end
    end
  end
  
  describe "Paramount average rating" do
    let(:movies_paramount) do
      movies = [
        {:name => 'Star Trek', :rating => 2},
        {:name => 'The Wolf of Wall Street', :rating => 4}
      ]
      movies.map { |m| Movie.new(m) }
    end
    
    it "should return 0 when the list is empty" do
      allow(Movie).to receive(:from_paramount).and_return([])
      expect(Movie.average_paramount_rating).to be == 0
    end
    
    it "should return the correct average rating (first way)" do
      allow(Movie).to receive(:from_paramount).and_return(movies_paramount)
      expect(Movie.average_paramount_rating).to be == 3
    end
    
    it "should return the correct average rating (second way)" do
      Movie.should_receive(:from_paramount).and_call_original
      expect(Movie.average_paramount_rating).to be == 6.8
    end
    
    it "should return the correct average rating (third way)" do
      expect(Movie).to receive(:from_paramount).and_call_original
      expect(Movie.average_paramount_rating).to be == 6.8
    end
    
    it "should return the correct average rating (4th way)" do
      Movie.stub(:from_paramount).and_return(movies_paramount)
      expect(Movie.average_paramount_rating).to be == 3
    end
    
    it "should return the correct average rating (5th way)" do
      Movie.stub(:from_paramount).and_return(movies_paramount)
      expect(Movie.average_paramount_rating).to be == 3
    end
  end
end
