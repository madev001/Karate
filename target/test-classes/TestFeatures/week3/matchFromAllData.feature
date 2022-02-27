Feature: verify if elements exists in csv file

  Background: 
    * def expectedFile = read('classpath:/TestData/AllDataCc.csv')

  Scenario: check if response contains csv values emails
    Given url 'https://reqres.in/api/users?page=1'
    When method GET
    Then status 200
    And def acc = response
    #function to convert id to number in order to match by id
    * def fun = function(x){ x.id = ~~x.id; return x }
    * def expected = karate.map(expectedFile, fun)
    #function to get only emails
    * def filt = function(x){ return x.email }
    * def expectedEmails = karate.map(expected, filt)
    * print expectedEmails
    #match the response by expected emails
    * match  acc.data[*].email contains expectedEmails
    #function to get only ids
    * def filt = function(x){ return x.id }
    * def expectedIds = karate.map(expected, filt)
    * print expectedIds
    #match the response by expected emails
    * match  acc.data[*].id contains expectedIds
