Feature: GET API query Parameters

  Scenario: get all active user details
  	* def query = {status:'active'}
  	Given url baseUrl+'/public/v2/users'
  	And params query
  	When method GET
  	Then status 200
  	  	
  Scenario: get all active & male user details
  	* def query = {status:'active' , gender:'male'}
  	Given url baseUrl+'/public/v2/users'
  	And params query
  	When method GET
  	Then status 200
  	* print response
  	
  	
  Scenario: get respective id active user details
  	* def query = {status:'active' , gender:'male', id:6752831}
  	Given url baseUrl+'/public/v2/users'
  	And params query
  	When method GET
  	Then status 200
  	* print response
  	* print response
  	* def jsonRes = response
  	* print jsonRes
  	* def actualName = jsonRes.name
  	* def actualid = jsonRes.id
  	* match actualName == 'Rev. Arnesh Gupta'
  	* match actualid == 6752831 
  	
  	