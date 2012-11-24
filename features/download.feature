Feature: Download the Hacker News Home Page
	In order to calculate the mean, median, and mode
	I need to download the home page from this feed http://api.ihackernews.com/page
	
	Scenario: download the page
		Given a Hacker News
		When I download <http://api.ihackernews.com/page>
		Then the response is not an error
			And the response is a JSON string
			
	Scenario: fail to download the page
		Given a Hacker News
		When I download <http://api.ihackernews.com/pag>
		Then the response is an error