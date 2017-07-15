post '/tweets' do
  burger = params.values.join(' ')
  TwitterAdapter.post("Burg of the day: The #{burger} burger #burgoftheday")
  erb :'tweets/show'
end
