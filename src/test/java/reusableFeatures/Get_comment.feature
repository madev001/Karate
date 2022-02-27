Feature: Get comments

  Background: 
    * url JsonPlaceholderURL
    * def parametres =
    """
    {
     id: #(id),
     }
     """

  Scenario: get comments
  	* print parametres.id
    Given path '/posts/', parametres.id ,'/comments'
    When method get
    Then status 200
    And print response
