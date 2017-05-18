# Twitter advertising list to CSV thinger

1. Read this tweet to get an idea what this is about: https://twitter.com/yehoak/status/864992540327649280
2. Create an app on twitter: https://apps.twitter.com/
3. Fill in `config.yml.example` with the keys you're given and rename it to `config.yml`
4. Request your PDF from twitter and download it
5. `gem install bundler` (you need Ruby installed for this to work)
6. `bundle`
7. `bundle exec ruby block.rb ~/Downloads/twitter_advertiser_list.pdf > blocklist.csv` (or wherever you downloaded your PDF to and wherever you want your CSV to go)
8. Go import that CSV (it will take a while)
