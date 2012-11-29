Feature: Send an email with the mean, mode and median and any stories with score higher than the median

	Scenario: Send an email to rossfinch@gmail.com
		Given a Hacker News
		Then I download <http://api.ihackernews.com/page>
		Then extract the stories
		And calculate the mean score of all the stories
		And calculate the mode of the score of all the stories
		And calculate the median of the score of all the stories
		Then I get all the stories with a score greater than the median
		Then I send an email to "rossfinch@gmail.com"
		And "test@email.com" should recieve an email
