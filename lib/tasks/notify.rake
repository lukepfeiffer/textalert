desc 'Text Alert'
task :notify => :environment do
  events = Event.where('send_at >= ? and send_at <= ?', 10.minutes.ago, Time.now)

  account_sid = 'ACa4f408d6ecb60f0ae0a6f6b2506e2a9c'
  auth_token = '1ae855398b1eb5baf3e6a7fab26db491'

  Twilio.configure do |config|
    config.account_sid = account_sid
    config.auth_token = auth_token
  end

  client = Twilio::REST::Client.new account_sid, auth_token

  events.each do |event|
    client.messages.create(
      from: '+19713404074',
      to: event.user.phone_number,
      body: event.title + ': ' + event.desc
     )
  end
end
