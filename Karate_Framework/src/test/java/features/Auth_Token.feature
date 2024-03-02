Feature: Passing Authorization Token
  
  Scenario: Passing Authorization Toekn
  	* print tokenID
  	Given header Authorization = 'Bearer '+ tokenID
  	Given url baseUrl+'/public/v2/users'
  	And path '6752838'
  	When method GET
  	Then status 200
  	* print response
