require "pdf/reader"

pdf = PDF::Reader.new(ARGV.first)
text = pdf.pages.map(&:text).join("\n")
handles = text.scan(/@(\w+)/).flatten

require "yaml"
config = YAML.load_file("config.yml")

require "twitter"
twitter_api = Twitter::REST::Client.new(config)

handles.each_with_index do |user, index|
  print "(#{index+1}/#{handles.length}) Blocking advertiser #{user}..."
  $stdout.flush
  arg = {
    "screen_name": user
  }
  req = Twitter::REST::Request.new(twitter_api, :post, '/1.1/blocks/create.json', arg)
  found = true
  begin
    res = req.perform
  rescue Twitter::Error::NotFound => e
    found = false
  end
  if found
    puts "done"
  else
    puts "not found, skipping"
  end
end
