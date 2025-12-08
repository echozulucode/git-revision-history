@cli @ollama @ai-generation
Feature: CLI Ollama Integration
  As a CLI User
  I want to generate release notes directly using a local Ollama model
  So that I don't need to copy-paste data between windows

  Scenario: Successfully generate release notes via Ollama
    Given the Ollama service is running at "http://localhost:11434"
    And the model "llama3" is available
    When I run the CLI with arguments:
      | arg            | value       |
      | --start        | HEAD~1      |
      | --end          | HEAD        |
      | --ollama-model | llama3      |
      | --output       | notes.md    |
    Then the CLI should construct a prompt combining context and system instructions
    And the CLI should send a POST request to the Ollama API
    And the generated content should be saved to "notes.md"

  Scenario: Handle Ollama connection failure
    Given the Ollama service is NOT running
    When I run the CLI with arguments:
      | arg            | value       |
      | --start        | HEAD~1      |
      | --ollama-model | llama3      |
    Then the CLI should exit with a connection error message
