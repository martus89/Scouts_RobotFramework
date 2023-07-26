*** Settings ***
Library     SeleniumLibrary
Documentation   Suite description

*** Variables ***
${LOGIN URL}                    https://scouts-test.futbolkolektyw.pl/en
${BROWSER}                      Chrome
${EMAILINPUT}                   xpath=//*[@id='login']
${PASSWORDINPUT}                xpath=//*[@id='password']
${SIGNINBUTTON}                 xpath=//button[@type='submit']
${ACTIVITYLASTCREATEDMATCH}     xpath=//a[3]/button
${FORMSUBMITBUTTON}             xpath=//button[@type='submit']/span

*** Test Cases ***
Login to the system
    Open login page
    Type in email and password
    Click submit button
    Open last created match
    Assert element text
    [Teardown]  Close browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}  ${BROWSER}
Type in email and password
    Input Text      ${EMAILINPUT}       user01@getnada.com
    Input Password  ${PASSWORDINPUT}    Test-1234
Click submit button
    Click Button    ${SIGNINBUTTON}
Open last created match
    Wait Until Element Is Visible   ${ACTIVITYLASTCREATEDMATCH}     timeout=30
    Click Element                   ${ACTIVITYLASTCREATEDMATCH}
Assert element text
    Wait Until Element Is Visible   ${FORMSUBMITBUTTON}     timeout=30
    Get Text                        ${FORMSUBMITBUTTON}
    Element Text Should Be          ${FORMSUBMITBUTTON}     SUBMIT
    Capture Page Screenshot         alert_open_last_created_match.png


