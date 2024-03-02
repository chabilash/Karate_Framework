Feature: GET API Headers feature
  
  Scenario: pass the user request with headers - Part -1
  	Given header Accept-Encoding = 'gzip, deflate, br'
  	And header Connection = 'keep-alive'
  	
  	When url baseUrl+'/public/v2/users'
  	And path '6752838'
  	When method GET
  	Then status 200
  	* print response
  	
  Scenario: pass the user request with headers - Part -2
  	* def request_headers = {Accept-Encoding : 'gzip, deflate, br' , Connection : 'keep-alive'}
  	Given headers request_headers
  	When url baseUrl+'/public/v2/users'
  	And path '6752838'
  	When method GET
  	Then status 200
  	* print response
  	
  	
  Scenario: pass the user request with headers - Part -2
  	* configure headers = {Accept-Encoding : 'gzip, deflate, br' , Connection : 'keep-alive'}
  	Given url baseUrl+'/public/v2/users'
  	And path '6752838'
  	When method GET
  	Then status 200
  	* print response