# This file contains a user story for demonstration only.
# Learn how to get started with Behat and BDD on Behat's website:
# http://behat.org/en/latest/quick_start.html

Feature:
    In order to prove that the Behat Symfony extension is correctly installed
    As a user
    I want to have a demo scenario

    Scenario: It receives a response from Symfony's kernel
        When a demo scenario sends a request to "/"
        Then the response should be received

    Scenario: A user can login
        Given I am on "http://localhost:8000/admin"
        And fill in "username" with "admin"
        And fill in "password" with "123"
        And press "_submit"
        # And print last response
        Then I should see "admin"
