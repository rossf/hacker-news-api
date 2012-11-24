Feature: Calculate the mean, mode and median scores on a Hacker News response

	Scenario: calculate the mean
		Given a Hacker News
		And I download <http://api.ihackernews.com/page>
		Then extract the stories
		Then calculate the mean score of all the stories