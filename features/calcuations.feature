Feature: Calculate the mean, mode and median scores on a Hacker News response

	Scenario: Calculate the mean
		Given a Hacker News
		And I download <http://api.ihackernews.com/page>
		Then extract the stories
		And calculate the mean score of all the stories
		
	Scenario: Calculate the mode
		 Given a Hacker News
		And I download <http://api.ihackernews.com/page>
		Then extract the stories
		And calculate the mode of the score of all the stories