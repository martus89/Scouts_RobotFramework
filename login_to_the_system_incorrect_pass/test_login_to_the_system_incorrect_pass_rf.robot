*** Settings ***
Library         SeleniumLibrary
Documentation   Suite description
Resource        ../resources.robot
Test Setup      Run Keywords    Log in to the system with wrong password

*** Variables ***
${INCORRECTPASSERROR}   xpath=//div[1]/div[3]/span

*** Test Cases ***
Login to the system wrong password
    Assert title of page and error presence
    Sleep                           2s
    [Teardown]  Close browser

*** Keywords ***
Assert title of page and error presence
    Get Title
    Wait Until Element Is Visible   ${INCORRECTPASSERROR}
    Get Text                        ${INCORRECTPASSERROR}
    Title Should Be                 Scouts panel - sign in
    Element Text Should Be          ${INCORRECTPASSERROR}   Identifier or password invalid.
    Capture Page Screenshot         alert_login_to_the_system_incorrect_pass.png


