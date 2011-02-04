Feature: User edits a project
  In order to keep my projects up to date
  As a user
  I want to edit an existing project

  Scenario: User edits a project
    Given I am logged in
    And a project exists
    And I am on the admin projects page
    When I follow "Edit" in the first project

    And I fill in "Title" with "Rubygems"
    And I fill in "Url" with "http://rubygems.org"

    And I press "Update project"
    Then I should see "Project was successfully updated."
    And I should see "Rubygems" in the projects list
