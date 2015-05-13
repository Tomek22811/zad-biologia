Feature: I would like to edit monkey

  Scenario Outline: Insert records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "loremipsum"
    And I press "Login"
    And I go to "/admin/monkey/"
    Then I should not see "<monkey>"
    And I follow "Create a new entry"
    Then I should see "monkey creation"
    When I fill in "Name" with "<monkey>"
    And I fill in "Weight" with "<weight>"
    And I press "Create"
    Then I should see "<monkey>"
    And I should see "<weight>"

  Examples:
    |monkey         |weight |
    |capuchin       |1      |
    |baboon         |40     |
    |mandrill       |34     |



  Scenario Outline: Edit records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "loremipsum"
    And I press "Login"
    And I go to "/admin/monkey/"
    Then I should not see "<new-monkey>"
    When I follow "<old-monkey>"
    Then I should see "<old-monkey>"
    When I follow "Edit"
    And I fill in "Name" with "<new-monkey>"
    And I fill in "Weight" with "<new-weight>"
    And I press "Update"
    And I follow "Back to the list"
    Then I should see "<new-monkey>"
    And I should see "<new-weight>"
    And I should not see "<old-monkey>"

  Examples:
    |old-monkey    |new-monkey  |new-weight|
    |capuchin      |proboscis   |25        |
    |baboon        |spider      |9         |


  Scenario Outline: Delete records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "loremipsum"
    And I press "Login"
    And I go to "/admin/monkey/"
    Then I should see "<monkey>"
    When I follow "<monkey>"
    Then I should see "<monkey>"
    When I press "Delete"
    Then I should not see "<monkey>"

  Examples:
    |monkey     |
    |proboscis  |
    |spider     |
    |mandrill   |

