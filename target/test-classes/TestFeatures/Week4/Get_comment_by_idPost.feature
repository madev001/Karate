Feature: Get comments by calling other feature

  Background: 
    * url JsonPlaceholderURL
    * def parametres =
    """
    {
     id_post: #(id_post),
     }
     """
  Scenario: Get comments by post
  	* def param = parametres.id_post
  	* print param
    Given path '/posts/', param
    When method get
    Then status 200
    And print response
    * def Comments = call read('classpath:/reusableFeatures/Get_comment.feature') { id: parametres.id_post}
    And print Comments.response
    