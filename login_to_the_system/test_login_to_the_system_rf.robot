*** Settings ***
Library     SeleniumLibrary
Documentation   Suite description

*** Variables ***
${LOGIN URL}            https://scouts-test.futbolkolektyw.pl/en
${BROWSER}              Chrome
${EMAILINPUT}           xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${SIGNINBUTTON}         xpath=//button[@type='submit']
${ADDPLAYERBUTTON}      xpath=//div[2]//a/button

*** Test Cases ***
Login to the system
    Open login page
    Type in email and password
    Click submit button
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
Assert title of page
    Wait Until Element Is Visible   ${ADDPLAYERBUTTON}  timeout=20
    Get Title
    Title Should Be    Scouts panel
    Capture Page Screenshot    alert_login_to_the_system.png


