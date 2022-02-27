Feature: Call methode to string from java class

  Background: 
    #* url BaseURL
    * def exp1 = read('classpath:/TestData/data.csv')


  Scenario: check if response contains csv values ids
    Given url 'https://reqres.in/api/users?page=2'
    #Given path '/users?page=2'
    #This function to get values without keys
    * def ids = karate.jsonPath(exp1,"$..id")
    * print ids
    #call Convert java function
    * def fun = Java.type('Functions.ConvertS2N')
    * def exp = fun.castS2N(ids)
    * print exp
    When method GET
    Then status 200
    And def acc = response
    * match acc.data[*].id contains  exp
