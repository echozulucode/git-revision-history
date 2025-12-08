@core @filtering
Feature: Noise Filtering
  As a Developer
  I want the system to automatically exclude irrelevant files from the diff
  So that the AI model is not distracted by lockfiles, assets, or binary data

  Background:
    Given a git repository exists

  Scenario Outline: Exclude specific noise files by extension
    Given a file named "<filename>" has changed between the selected versions
    When I generate the release context
    Then the diff for "<filename>" should NOT be included in the output

    Examples:
      | filename          | reason           |
      | package-lock.json | NPM lockfile     |
      | yarn.lock         | Yarn lockfile    |
      | logo.png          | Image asset      |
      | icon.ico          | Binary icon      |
      | __pycache__/x.pyc | Python bytecode  |

  Scenario: Include relevant source code files
    Given a file named "src/main.rs" has changed between the selected versions
    When I generate the release context
    Then the diff for "src/main.rs" SHOULD be included in the output
