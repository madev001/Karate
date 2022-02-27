Feature: Get person from list


  Scenario: check person in page 1 
    Given url 'https://reqres.in/api/users?page=1'
    When method GET
    Then status 200
    * def email = 'george.bluth@reqres.in'
    And match response.data[*].email contains email
    * def exp = email
