@gui @settings
Feature: User Configuration
  As a Desktop App User
  I want the application to remember my preferences
  So that I don't have to re-configure it every time I launch it

  Scenario: Persist last opened repository
    Given I have successfully opened the repository at "C:/Projects/AppA"
    When I close and reopen the application
    Then the repository at "C:/Projects/AppA" should be automatically loaded

  Scenario: Persist AI Model selection
    Given I change the selected AI Model to "mistral:latest"
    When I close and reopen the application
    Then the AI Model selector should show "mistral:latest"

  Scenario: Configure Jira Credentials
    When I open the "Settings" dialog
    And I enter "https://jira.company.com" into "Jira URL"
    And I enter a hidden token into "Personal Access Token"
    And I click "Save"
    Then the credentials should be securely stored
    And future generation requests should use these credentials
