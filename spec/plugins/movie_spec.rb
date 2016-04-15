require_relative '../spec_helper'

RSpec.describe Plugins::Movie do
  describe "#action" do
    it "does good" do
      expect(Tmdb::Movie).to receive(:find).with('deadpool') do
        [
          OpenStruct.new(
            title: 'Deadpool',
            poster_path: 'asdf.jpg',
            release_date: '2016-02-09',
            vote_average: 7.18,
            overview: 'its a movie',
            id: 1234)
        ]
      end

      message = Plugins::Movie.message("movie deadpool")
      expect(message.action).to eq('Deadpool')
      expect(message.body).to include('asdf.jpg')
      expect(message.body).to include('2016-02-09')
      expect(message.body).to include('7.18')
      expect(message.body).to include('its a movie')
    end
  end
end
