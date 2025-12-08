@integration @jira
Feature: Jira Enrichment
  As a Product Manager
  I want the release notes to include details from linked Jira tickets
  So that stakeholders can see the business context of the changes

  Background:
    Given Jira integration is configured with valid credentials

  Scenario: Extract and Enrich Jira Keys
    Given a commit message contains "PROJ-123: Fix login bug"
    When I generate the release context
    Then the system should identify "PROJ-123" as a Jira key
    And the system should fetch the issue details from the Jira API
    And the output should contain a "Linked Jira Issues" section
    And the section should include the summary and status for "PROJ-123"

  Scenario: Handle missing or invalid keys
    Given a commit message contains "PROJ-999" which does not exist in Jira
    When I generate the release context
    Then the system should attempt to fetch "PROJ-999"
    And the system should log a warning for the missing issue
    But the context generation should NOT fail
    And "PROJ-999" should NOT appear in the "Linked Jira Issues" table
