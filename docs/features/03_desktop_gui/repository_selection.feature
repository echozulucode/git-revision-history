@gui @navigation
Feature: Repository Selection
  As a Desktop App User
  I want to open a local git repository
  So that I can select versions to analyze

  Scenario: Open a valid Git repository
    When I click "Open Repository"
    And I select the folder "C:/Projects/MyRepo" which is a git root
    Then the application should load the repository details
    And the "Start Reference" dropdown should be populated with tags and branches
    And the "End Reference" dropdown should be populated with tags and branches

  Scenario: Attempt to open a non-Git folder
    When I click "Open Repository"
    And I select the folder "C:/Photos" which is NOT a git root
    Then an error message "Not a valid Git repository" should be displayed
    And the repository selection should remain empty
