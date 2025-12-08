@core @context-generation
Feature: Context Aggregation
  As a Release Manager
  I want to aggregate git commit logs and file diffs between two versions
  So that I can provide an AI model with accurate technical context for writing release notes

  Background:
    Given a git repository with the following history:
      | commit | message          | file          | content |
      | A      | Initial commit   | README.md     | Hello   |
      | B      | Add feature X    | src/feat.rs   | code X  |
      | C      | Fix bug Y        | src/fix.rs    | code Y  |

  Scenario: Generate context from two valid commit hashes
    Given I specify the start reference as "A"
    And I specify the end reference as "C"
    When I request the release context
    Then the output should contain the commit message "Add feature X"
    And the output should contain the commit message "Fix bug Y"
    And the output should contain the diff for "src/feat.rs"
    And the output should contain the diff for "src/fix.rs"

  Scenario: Include Adhoc User Notes
    Given I have a notes file "notes.md" with content "Focus on the new API."
    And I specify the start reference as "A"
    And I specify the end reference as "B"
    And I include the notes file "notes.md"
    When I request the release context
    Then the output should start with the header "Strategic Context / Adhoc Notes"
    And the output should contain "Focus on the new API."

  Scenario: Handle invalid references gracefully
    Given I specify the start reference as "INVALID_HASH"
    When I request the release context
    Then the system should return an error indicating the reference does not exist
