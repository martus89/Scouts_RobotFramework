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
${ADDPLAYERFORMNAME}    xpath=//input[@name='name']


*** Test Cases ***
Login to the system
    Open login page
    Type in email and password
    Click submit button
    Click add player button
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
Click add player button
    Wait Until Element Is Visible   ${ADDPLAYERBUTTON}  timeout=20
    Click Button    ${ADDPLAYERBUTTON}

Assert title of page
    Wait Until Element Is Visible   ${ADDPLAYERFORMNAME}    timeout=20
    Get Title
    Title Should Be    Add player
    Capture Page Screenshot    alert_title_of_add_player.png


