Feature: POST API Feature - Create Random User
  I want to create User through POST Call

  Background:
		* url baseUrl
		* def random_String = 
		"""
			function(s){
				var text = "";
				var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
				for(var i=0;i<s;i++)
					text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
					return text;
							
			}
		"""
		* def randomString = random_String(10)
		* print randomString
		* def requestPayload = 
		"""
		{
		
    "gender" : "male",
    "status" : "active"
		}
	
		"""
		*	requestPayload.email = randomString + "@gmail.com"
		* print randomString 
		*	requestPayload.name = randomString
		
  Scenario: Create new Random User
  	Given path '/public/v2/users'
  	And request requestPayload
  	And header Authorization = 'Bearer '+ tokenID
  	When method POST
  	Then status 201
  	And match $.id == '#present'
  	And match $.name == requestPayload.name
  	And match $.email == requestPayload.email
  	
   