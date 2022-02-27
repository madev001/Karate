@tag
Feature: Get post and comments from csv

  Background: 
    * url JsonPlaceholderURL

  Scenario Outline: Get post and comments from csv
    Given path  '/posts/', <id>
    When method get
    Then status 200
    * def posts = call read('classpath:/TestFeatures/Week4/Get_comment_by_idPost.feature') { id_post: <id>}
    And print posts.response

    Examples: 
      | id |
      |  1 |
      |  2 |
