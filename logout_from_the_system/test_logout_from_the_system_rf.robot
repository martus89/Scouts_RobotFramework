*** Settings ***
Library     SeleniumLibrary
Documentation   Suite description

*** Variables ***
${LOGIN URL}            https://scouts-test.futbolkolektyw.pl/en
${BROWSER}              Chrome
${EMAILINPUT}           xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${SIGNINBUTTON}         xpath=//button[@type='submit']
${SIGNOUTBUTTON}        xpath=//div[1]/ul[2]/div[2]

*** Test Cases ***
Login to the system
    Open login page
    Type in email and password
    Click submit button
    Click sign out button
    Assert title of page
    [Teardown]  Close browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}  ${BROWSER}
Type in email and password
    Input Text      ${EMAILINPUT}       user01@getnada.com
    Input Password  ${PASSWORDINPUT}    Test-1234
Click submit button
    Click Button    ${SIGNINBUTTON}
    Wait Until Element Is Enabled   ${SIGNOUTBUTTON}  timeout=300
Click sign out button
    Click Element                   ${SIGNOUTBUTTON}
Assert title of page
    Wait Until Element Is Visible   ${SIGNINBUTTON}  timeout=300
    Get Title
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot    user_sign_out.png