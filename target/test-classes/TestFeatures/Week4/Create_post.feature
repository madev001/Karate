Feature: Create  post by users ids from csv and get response

  Background: 
    * url JsonPlaceholderURL

  @createFromCsv
  Scenario Outline: Create  post by users ids from csv and get response
  	* print __row
    Given path '/posts'
    And request {"title": <title>,"body": <body>,"userId": <userId>}
    When method POST
    Then status 201
    And print response.id
    * def id_post = $.id
    * def post = call read('classpath:/reusableFeatures/GetPostByIdPost.feature') { id_post: '#(id_post)' }
    #And match post.response == response
    And print post.response
    And match post.response.id == response.id
    Examples:
    
    | read('classpath:/TestData/DataForCreatePostByUserId2.csv') |