require 'pony'

class Mailer
  def send(address, mean, mode, median, stories)
    body = <<-EOMAIL
      <p>The mean is #{mean}.</p>
      <p>The mode is #{mode}.</p>
      <p>The median is #{median}.</p>
      You might be interested in these stories:
      <ul>
    EOMAIL
    stories.each do |story|
      body = body + "<li><a href=\"#{story['url']}\">#{story['title']}</a></li>"
    end
    body = body + "</ul>"
    
    Pony.mail(:from => 'HackerNewsMailer@test.com',
              :to => address,
              :subject => 'Hacker News Digest',
              :html_body => body
    )
  end
end