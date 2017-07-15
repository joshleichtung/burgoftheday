require 'uri'
require 'net/http'
require 'openssl'
require 'json'

module DataMuseAdapter
  URL = "https://api.datamuse.com/words?"

  def self.approximate_rhymes(word)
    url = URI(URL + "ml=food&rel_nry=#{word}")
    make_request(url)[0,2]
  end

  def self.sounds_like(word)
    url = URI(URL + "ml=food&sl=#{word}")
    make_request(url)[0,2]
  end

  def self.perfect_rhymes(word)
    url = URI(URL + "ml=food&rel_rhy=#{word}")
    make_request(url)[0,2]
  end

  def self.consonants(word)
    url = URI(URL + "ml&food&rel_cns=#{word}")
    make_request(url)[0,2]
  end

  def self.all_related(word)
    results = []
    results += self.approximate_rhymes(word)
    results += self.sounds_like(word)
    results += self.perfect_rhymes(word)
    # results += self.consonants(word)
  end

  private
  def self.make_request(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    JSON.parse(http.request(request).read_body).map{|word| word["word"]}
  end
end
