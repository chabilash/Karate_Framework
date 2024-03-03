Feature: PUT API Feature - Update 1 or more User details
  I want to update User through PUT Call

  Background:
		* url baseUrl
		* def requestPayload = 
		"""
		{
        "status" : "active",
        "email" : "karate111@gmail.com"
		}
		
		"""
		
  Scenario: Update User detail
  	Given path '/public/v2/users/6755919'
  	And request requestPayload
  	And header Authorization = 'Bearer '+ tokenID
  	When method PUT
  	Then status 200
  	* print response
  	And match $.id == '#present'
  	And match $.name == '5iTnjrlqAK'
  	And match $.email == 'karate111@gmail.com'
   