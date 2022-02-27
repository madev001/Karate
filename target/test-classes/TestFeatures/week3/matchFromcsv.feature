Feature: verify if elements exists in xlsx file

  Background: 
    #* def id = read('classpath:/TestData/allDataIds.csv')

  Scenario Outline: get - <id>
    Given url 'https://jsonplaceholder.typicode.com/posts/'
    And path  1
    When method GET
    * print 'current id is ->', id
    * print id
    Then status 200
    #* print response.id
    And match response.id contains id

    #* print ids
    #And match response contains request.response
    #And match response.data { id:'#number', first_name:'<first_name>' }
    Examples: 
      | read('classpath:/TestData/allDataIds.csv') |
     #| id |
     #| 1 |
     #| 2 |
