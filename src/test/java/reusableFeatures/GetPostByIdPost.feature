Feature: Get post by id post
Background: 
    * url JsonPlaceholderURL
    * def parametres =
    """
    {
     id_post: #(id_post),
     }
     """
  @tag1
  Scenario: Get post by id post
    Given path  '/posts/', parametres.id_post
    When method get
    #Then status 200
    Then status 404
    #* def posts = call read('classpath:/TestFeatures/Week4/Get_comment_by_idPost.feature') { id_post: <id>}
