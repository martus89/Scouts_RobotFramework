*** Settings ***
Library     SeleniumLibrary
Documentation   Suite description
Resource        resources.robot
Test Setup      Run Keywords    Login to the system EN

*** Variables ***
${SIGNOUTBUTTON}        xpath=//div[1]/ul[2]/div[2]

*** Test Cases ***
Logout from the system
    Assert title of page
    [Teardown]  Close browser

*** Keywords ***
Assert title of page
    Wait Until Element Is Visible   ${SIGNINBUTTON}  timeout=300
    Get Title
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot    user_sign_out.png