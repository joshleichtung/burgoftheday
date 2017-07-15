post '/rhymes' do
  @words = params[:search_phrase].split(' ')
  @words = @words.map do |word|
    {original: word, rhymes: DataMuseAdapter.all_related(word)}
  end
  erb :'rhymes/show'
end
