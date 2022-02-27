Feature: Create one post by user id and get response

  Background: 
    * url JsonPlaceholderURL

  @tag1
  Scenario Outline: create post
    Given path '/posts'
    And request {"userId": <userId>,"title": <title>,"body": <body>}
    When method POST
    Then status 201
    And print response.id
    * def id_post = $.id
    * def post = call read('classpath:/reusableFeatures/GetPostByIdPost.feature') { id_post: '#(id_post)' }
    And match post.response == response
    Examples:
    |userId|title|body|
    |1|'test title'|'test body'|