*** Settings ***
Library         SeleniumLibrary
Documentation   Suite description
Resource        ../resources.robot
Test Setup      Run Keywords    Login to the system EN

*** Variables ***
${SIGNOUTBUTTON}        xpath=//div[1]/ul[2]/div[2]

*** Test Cases ***
Logout from the system
    Assert title of page
    Sleep                           4s
    Click Element                   ${SIGNOUTBUTTON}
    Sleep                           4s
    [Teardown]                      Close Browser

*** Keywords ***
Assert title of page
    Wait Until Element Is Visible   ${SIGNINBUTTON}  timeout=30
    Title Should Be                 Scouts panel - sign in
    Capture Page Screenshot         user_sign_out.png