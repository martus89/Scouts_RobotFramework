*** Settings ***
Library     SeleniumLibrary
Documentation   Suite description

*** Variables ***
${LOGIN URL}            https://scouts-test.futbolkolektyw.pl/en
${BROWSER}              Chrome
${EMAILINPUT}           xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${SIGNINBUTTON}         xpath=//button[@type='submit']
${INCORRECTPASSERROR}   xpath=//div[1]/div[3]/span
*** Test Cases ***
Login to the system
    Open login page
    Type in email and password
    Click submit button
    Assert title of page and error presence
    [Teardown]  Close browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}  ${BROWSER}
Type in email and password
    Input Text      ${EMAILINPUT}       user01@getnada.com
    Input Password  ${PASSWORDINPUT}    Pest-123401332ABC
Click submit button
    Click Button    ${SIGNINBUTTON}
Assert title of page and error presence
    Get Title
    Wait Until Element Is Visible   ${INCORRECTPASSERROR}
    Get Text                        ${INCORRECTPASSERROR}
    Title Should Be                 Scouts panel - sign in
    Element Text Should Be          ${INCORRECTPASSERROR}   Identifier or password invalid.
    Capture Page Screenshot         alert_login_to_the_system_incorrect_pass.png


