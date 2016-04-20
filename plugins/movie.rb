require_relative './plugin'
require 'themoviedb'

module Plugins
  class Movie < Plugin
    KEYWORD_NAME = 'movie'

    keyword KEYWORD_NAME, info: "[title] show info about a film"

    def initialize(info)
      @info = info
    end

    def response
      info = get_movie_info(@info.contents)
      Message.new(title: info[:title], body: info[:text])
    end

    private

    def get_movie_info(title)
      Tmdb::Api.key(ENV['TMDB_KEY'])

      if !title.empty? && info = Tmdb::Movie.find(title.strip).first
        { title: info.title,
            text: <<~MARKDOWN
            ![poster](https://image.tmdb.org/t/p/w396/#{info.poster_path})

            **Released**: #{info.release_date} \t **Rating**: #{info.vote_average}/10

            > #{info.overview}

            _Info provided by [TMDB](https://www.themoviedb.org/movie/#{info.id})_
          MARKDOWN
        }
      else
        {
         title: "Sorry",
         text: "I was not able to find the movie you are looking for."
        }
      end
    end
  end
end
