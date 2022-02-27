Feature: get person and verify if exist

    @tag1
  Scenario: verify if email doesn't exist in page 2 
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    * def person = call read('classpath:/reusableFeatures/getPerson.feature')
    * def exp = person.exp
    And print exp
    And match response.data[*].email !contains exp
