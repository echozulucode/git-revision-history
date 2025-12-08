@gui @workflow
Feature: Preview and Generate
  As a Desktop App User
  I want to preview the context and generate the final release notes
  So that I can verify the data before asking the AI to process it

  Background:
    Given a repository is loaded
    And "v1.0.0" is selected as Start Reference
    And "v1.1.0" is selected as End Reference

  Scenario: Preview Context
    When I navigate to the "Preview" tab
    Then the "Context Preview" area should display the aggregated Markdown
    And the preview should show the commit log between "v1.0.0" and "v1.1.0"

  Scenario: Generate Release Notes
    Given an Ollama model "llama3" is selected
    When I click the "Generate" button
    Then the application should enter a "Generating..." loading state
    And the output should be streamed to the "Release Notes" tab
    And the "Generate" button should be disabled during generation

  Scenario: Cancel Generation
    Given the application is currently generating release notes
    When I click the "Cancel" button
    Then the generation process should stop
    And the "Generate" button should become enabled
