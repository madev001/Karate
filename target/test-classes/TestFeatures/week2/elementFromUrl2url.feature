Feature: test request is response

  Background: 
    * def baseUrl = 'https://reqres.in/api'

  @tag1
  Scenario: get if cerulean exist
    Given url baseUrl
    And path '/users?page=2'
    When method GET
    Then status 200
    And def uResponse = response
    And print uResponse
    Then match uResponse.data[*].name contains  ['cerulean']
    Then def rec = uResponse.data.name = 'cerulean'

#in this exemple the records are different between the first and seconde url but they the id=2 exist in both so i check by id and match the name even if it's not the same
  @tag2
  Scenario: get if id 2 exist and verify the name  in the second url
    Given url baseUrl
    And path '/users?page=2'
    When method GET
    Then status 200
    And def uResponse = response
    And print uResponse
    Then match uResponse.data[*].id contains  [2]
    Then def idNumber = uResponse.data.id = 2
    And print idNumber
    
    Given url 'https://reqres.in/api/users/'
    And path idNumber
    When method GET
    Then print response
    And match $.data.last_name == 'Weaver'

 