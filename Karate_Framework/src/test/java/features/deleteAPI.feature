Feature: Delete API Feature - Create Random User(POST) & DELETE User & check whether User is deleted or not (GET)
  

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
		* def requestPOSTPayload = 
		"""
		{
		
    "gender" : "male",
    "status" : "active"
		}
	
		"""
		*	set requestPOSTPayload.email = randomString + "@gmail.com"
		* print randomString 
		*	set requestPOSTPayload.name = randomString
		
  Scenario: Create Random User & Delete User 
  #1. Create User using POST CALL
  	Given path '/public/v2/users'
  	And request requestPOSTPayload
  	And header Authorization = 'Bearer '+ tokenID
  	When method POST
  	Then status 201
  	* print response
  	And match $.id == '#present'
  	
  #Fetch Userid from POST call response
  	* def userId = $.id
  	* print userId
  	
  #2. DELETE the same above User
		Given path '/public/v2/users/' +userId
  	And header Authorization = 'Bearer '+ tokenID
  	When method DELETE
  	Then status 204
  #3. Check whether User is deleted or not through GET call
  	Given path '/public/v2/users/' +userId
  	And header Authorization = 'Bearer '+ tokenID
  	When method GET
  	Then status 404
  	* print response
  	And match $.message == 'Resource not found'
  	
  	
  	
  	
  	
  	
  	
	