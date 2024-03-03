Feature:  GET API Feature
  
  Scenario: get user details
  	Given url baseUrl+'/public/v2/users'
  	And path '6755919'
  	When method GET
  	Then status 200
  	* print response
  	* def jsonResponse = response
  	* print jsonResponse
  	* def actualName = jsonResponse.name
  	* def actualId = jsonResponse.id
  	* def actualEmail = jsonResponse.email
  	* def actualGender = jsonResponse.gender
  	* def actualStatus = jsonResponse.status
  #	* print actualName
  #	* print actualId
  #	* print actualEmail
  #	* print actualGender
  #	* print actualStatus
  	* match actualName == 'Devvrat Achari'
  	* match actualId == 6752840
  	* match actualEmail == 'achari_devvrat@sawayn-jakubowski.example'
  	* match actualGender == 'male'
  	* match actualStatus == 'active'
  	
  	
   Scenario: get user details - user not found
  	Given url baseUrl+'/public/v2/users'
  	And path '30'
  	When method GET
  	Then status 404
  	* print response
  	* def jsonRes = response
  	* def actualMsg = jsonRes.message
  	* match actualMsg == 'Resource not found'
