*** Settings ***
Documentation               Csrinstore testing
Library                     RequestsLibrary
Library                     Selenium2Library
Resource                    ../../resources/suite_variables.robot
#Resource                    ../../resources/login.robot
Resource                    ../../resources/browsers.robot
Suite Setup                 Web suite setup
Suite Teardown              Web suite teardown
Test Setup                  Open BrowserCompatibility
Test Teardown               close browser


*** Keywords ***
Web suite setup
    Set suite variables

Web suite teardown
#    Close all browsers
    delete all sessions