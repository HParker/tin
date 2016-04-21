require_relative '../spec_helper'

RSpec.describe Plugins::Movie do
  describe '#action' do
    let(:info) { Info.new('movie deadpool', OpenStruct.new(ip: '0.0.0.0')) }
    subject { Plugins::Movie.new(info).response }
    it 'returns a movie' do
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

      expect(subject.title).to eq('Deadpool')
      expect(subject.body).to include('asdf.jpg')
      expect(subject.body).to include('2016-02-09')
      expect(subject.body).to include('7.18')
      expect(subject.body).to include('its a movie')
    end
  end
end
