require_relative './plugin'
require 'themoviedb'

module Plugins
  class Movie < Plugin
    KEYWORD_NAME = 'movie'

    keyword KEYWORD_NAME, info: "[title] show info about a film"

    class << self
      def message(title, _req)
        info = get_movie_info(title)
        Message.new(action: info[:title], body: info[:text])
      end

      private

      def get_movie_info(title)
        Tmdb::Api.key('a230f1c8a13699563ac819f74fb16230')
        info = Tmdb::Movie.find(title.strip).first

        { title: info.title,
          text: <<~MARKDOWN
            ![poster](https://image.tmdb.org/t/p/w396/#{info.poster_path})

            **Released**: #{info.release_date} \t **Rating**: #{info.vote_average}/10

            > #{info.overview}

            _Info provided by [TMDB](https://www.themoviedb.org/movie/#{info.id})_
          MARKDOWN
        }
      end
    end
  end
end
