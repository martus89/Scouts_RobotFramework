*** Settings ***
Library         SeleniumLibrary
Documentation   Suite description
Resource        ../resources.robot
Test Setup      Run Keywords    Log in to the system PL
Test Teardown   Run Keywords    Log Out And Close The Browser

*** Variables ***
${PLAYERSBUTTON}                    xpath=//ul[1]/div[2]
${EDITFIRSTENTRYINTABLE}            xpath=//td[1]
${MENUMATCHES}                      xpath=//div[1]//ul[2]/div[2]
${EDITFIRSTMATCHINTABLE}            xpath=//tr[1]/td[9]/a/button


*** Test Cases ***
Language switch of matches per player page
	Path to matches of player
	Manually Change Language
    Assert page redirect

*** Keywords ***
Path to matches of player
	Wait Until Element Is Visible           ${PLAYERSBUTTON}      timeout=30
	Click Element                           ${PLAYERSBUTTON}
	Wait Until Element Is Visible           ${EDITFIRSTENTRYINTABLE}      timeout=30
	Click Element                           ${EDITFIRSTENTRYINTABLE}
	Wait Until Element Is Visible           ${MENUMATCHES}      timeout=30
	Click Element                           ${MENUMATCHES}
	Wait Until Element Is Visible           ${EDITFIRSTMATCHINTABLE}      timeout=30

Manually Change Language
	Click Element                           ${LANGUAGECHANGEBUTTON}
	Wait Until Element Is Visible           ${EDITFIRSTMATCHINTABLE}      timeout=30

Assert page redirect
    Wait Until Location Contains    en/players
    Page Should Contain             Polski
    Capture Page Screenshot         download_players_file.png

