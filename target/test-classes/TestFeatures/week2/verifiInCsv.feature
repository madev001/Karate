Feature: verify if elements exists in csv file

  Background: 
  	#* url BaseURL
    * def exp = read('classpath:/TestData/data.csv')
    * def exp1 = read('classpath:/TestData/data1.csv')

  Scenario: check if response contains csv values ids
    Given url 'https://reqres.in/api/users?page=2'
   # Given path '/users?page=2'
    When method GET
    Then status 200
    #i used this fuction to convert string to number
    * def fun = function(x){ x.id = ~~x.id; return x }
    * def exp = karate.map(exp, fun)
    And def acc = response
    #i used deep to check 2 arrays
    * match acc.data[*] contains deep exp

  Scenario: check if response contains csv values emails
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And def acc = response
    * match acc.data[*] contains deep exp1
