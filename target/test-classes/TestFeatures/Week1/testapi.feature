Feature: test sample API

  Background: 
    * url 'https://reqres.in/api'
    * def output = read('classpath:/TestData/response1.json')
    * def request1 = read('classpath:/TestData/request1.json')

  Scenario: test API get 1
    Given path '/users?page=2'
    When method GET
    Then status 200
    And assert response.data.length == 6
    And print response.data[1].id
    And match $.data[0].id == 1
    And print response.data[0].year
    And match $.data[0].year == 2000

  Scenario: test API post 2
    Given path '/users'
    And request {"name": "Mouad" , "job": "tester" , "age": 25}
    When method POST
    Then status 201
    And match response == {"name":"Mouad","job":"tester","age":25,"id":"#string","createdAt":"#ignore"}
    And print response

  Scenario: test API post 3
    Given path '/users'
    And request {"name": "Mouad" , "job": "tester" }
    When method POST
    Then status 201
    And match response == output
    And print response

  Scenario: test API post 3
    Given path '/users'
    And request request1
    When method POST
    Then status 201
    And match response == output
    And print response
