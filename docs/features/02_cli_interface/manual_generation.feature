@cli @manual-workflow
Feature: CLI Manual Context Generation
  As a CLI User
  I want to generate a context file via command line arguments
  So that I can manually copy-paste it into an AI interface

  Scenario: Generate context with system prompt
    Given I have a system prompt file "prompt.md" containing "You are a PM."
    When I run the CLI with arguments:
      | arg             | value       |
      | --start         | HEAD~1      |
      | --end           | HEAD        |
      | --system-prompt | prompt.md   |
      | --output        | context.md  |
    Then the file "context.md" should be created
    And "context.md" should start with "You are a PM."
    And "context.md" should contain the separator "**Data to Process:**"

  Scenario: Generate context without system prompt
    When I run the CLI with arguments:
      | arg      | value       |
      | --start  | HEAD~1      |
      | --end    | HEAD        |
      | --output | context.md  |
    Then the file "context.md" should be created
    And "context.md" should NOT contain "**Data to Process:**"
