Feature: POST & PUT API Feature - Create Random User & Update User details in one go
  

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
		
  Scenario: Create Random User & Update User details in one go
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
  	
  	* def requestPUTPayload = 
		"""
		{
		
    "gender" : "female",
    "status" : "inactive"
		}
	
		"""
  	
  	# Put call to update the above user details
		Given path '/public/v2/users/' +userId
  	And request requestPUTPayload
  	And header Authorization = 'Bearer '+ tokenID
  	When method PUT
  	Then status 200
  	* print response
  	And match $.id == '#present'
  	And match $.id == userId
  	And match $.name == requestPOSTPayload.name
  	And match $.email == requestPOSTPayload.email
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
  	
  	
   