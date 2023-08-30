*** Settings ***
Documentation     Suite description
Library           OperatingSystem
Library           SeleniumLibrary
Resource          ../resources.robot
Test Setup        Run Keywords    Login to the system EN
Test Teardown     Run Keywords    Log Out And Close The Browser


*** Variables ***
${PLAYERSBUTTON}            xpath=//ul[1]/div[2]
${PLAYERSDOWNLOADBUTTON}    xpath=//button[contains(@data-testid,'Download CSV')]


*** Test Cases ***
Download CSV file of all players stored
    Click players dashboard
    Click download button
    Download CSV file

*** Keywords ***
Click players dashboard
    Wait Until Element Is Visible   ${PLAYERSBUTTON}            timeout=100
    Click Element                   ${PLAYERSBUTTON}
Click download button
    Wait Until Element Is Visible   ${PLAYERSDOWNLOADBUTTON}    timeout=100
    Click Element                   ${PLAYERSDOWNLOADBUTTON}
Download CSV file
    Sleep                       5s
    ${path}=                    Normalize Path      ~/Downloads
    ${RAND}=                    Evaluate            random.sample(range(1,11), 1)
    Move file                   ${path}/tableDownload.csv    ${CURDIR}/all_players_db${RAND}.csv
    File Should Exist           ${CURDIR}/all_players_db${RAND}.csv
    Capture Page Screenshot     test_download_players_file.png

