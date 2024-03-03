Feature: POST API Feature - Create User getting request payload from json file
  

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
		* def requestPayload = read('classpath:src/test/resources/payload/user.json')
		
		* def randomString = random_String(10)
		*	set requestPayload.email = randomString + "@gmail.com"
		* print randomString 
		*	set requestPayload.name = randomString
		* print requestPayload
	
		
  Scenario: Create new User
  	Given path '/public/v2/users'
  	And request requestPayload
  	And header Authorization = 'Bearer '+ tokenID
  	When method POST
  	Then status 201
  	And match $.id == '#present'
  	And match $.name == requestPayload.name
  	And match $.email == requestPayload.email
   