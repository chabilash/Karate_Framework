Feature: POST API Feature - Create User
  I want to create User through POST Call

  Background:
		* url baseUrl
		* def requestPayload = 
		"""
		{
    "name" : "James12345",
    "email" : "James12345@gmail.com",
    "gender" : "male",
    "status" : "active"
}
		
		"""
		
  Scenario: Create new User
  	Given path '/public/v2/users'
  	And request requestPayload
  	And header Authorization = 'Bearer '+ tokenID
  	When method POST
  	Then status 201
  	And match $.id == '#present'
  	And match $.name == 'James12345'
  	And match $.email == 'James12345@gmail.com'
   