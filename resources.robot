*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${LOGIN URL}                    https://dareit.futbolkolektyw.pl/en
${BROWSER}                      Chrome
${EMAILINPUT}                   xpath=//*[@id='login']
${PASSWORDINPUT}                xpath=//*[@id='password']
${LANGDROPDOWN}                 xpath=//form//div[2]/div/div
${ENGLISHLOGIN}                 xpath=//div[3]/ul/li[2]
${POLISHLOGIN}                  xpath=//div[3]/ul/li[1]
${SIGNINBUTTON}                 xpath=//button[@type='submit']
${ADDPLAYERBUTTON}              xpath=//div[2]//button
${LANGUAGECHANGEBUTTON}         xpath=//div[div[span[contains(text(), 'English') or contains(text(), 'Polski')]]]
${LOGOUTBUTTON}                 xpath=//span[contains(text(), 'Sign out') or contains(text(), 'Wyloguj')]


*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}  ${BROWSER}

Type in email
    Input Text      ${EMAILINPUT}       user01@getnada.com

Type in password
    Input Password  ${PASSWORDINPUT}    Test-1234

Type in wrong password
    Input Password  ${PASSWORDINPUT}    Pest-123401332ABC

Click dropdown menu
	Click Element   ${LANGDROPDOWN}

Choose English Language
	Click Element   ${ENGLISHLOGIN}

Choose Polish Language
	Click Element   ${POLISHLOGIN}

Click log in button
    Click Button    ${SIGNINBUTTON}

Wait for dashboard to open
    Wait Until Element Is Visible   ${ADDPLAYERBUTTON}      timeout=20

Manually change language
	Click Element    ${LANGUAGECHANGEBUTTON}

Log Out And Close The Browser
	Click Element    ${LOGOUTBUTTON}
    Close Browser


Log in to the system EN
    Open login page
    Type in email
    Type in password
    Click dropdown menu
    Choose English Language
    Click log in button
    Wait for dashboard to open


Log in to the system PL
    Open login page
    Type in email
    Type in password
    Click dropdown menu
    Choose Polish Language
    Click log in button
    Wait for dashboard to open


Log in to the system with wrong password
    Open login page
    Type in email
    Type in wrong password
    Click dropdown menu
    Choose English Language
    Click log in button
    Wait for dashboard to open