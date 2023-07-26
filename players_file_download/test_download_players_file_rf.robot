*** Settings ***
Documentation     Suite description
Library           OperatingSystem
Library           Selenium2Library


*** Variables ***
${LOGIN URL}                https://scouts-test.futbolkolektyw.pl/en
${RANDOM_NR}=               random.randint(0, 99)
${BROWSER}                  Chrome
${EMAILINPUT}               xpath=//*[@id='login']
${PASSWORDINPUT}            xpath=//*[@id='password']
${SIGNINBUTTON}             xpath=//button[@type='submit']
${PLAYERSBUTTON}            xpath=//ul[1]/div[2]
${PLAYERSDOWNLOADBUTTON}    xpath=//button[contains(@data-testid,'Download CSV')]


*** Test Cases ***
Download CSV file of all players stored
    Open login page
    Type in email and password
    Click submit button
    Click players dashboard
    Click download button
    Download CSV file
    [Teardown]  Close browser

*** Keywords ***
Open login page
    Open Browser      ${LOGIN URL}  ${BROWSER}
Type in email and password
    Input Text      ${EMAILINPUT}       user01@getnada.com
    Input Password  ${PASSWORDINPUT}    Test-1234
Click submit button
    Click Button    ${SIGNINBUTTON}
Click players dashboard
    Wait Until Element Is Visible   ${PLAYERSBUTTON}  timeout=100
    Click Element                   ${PLAYERSBUTTON}
Click download button
    Wait Until Element Is Visible   ${PLAYERSDOWNLOADBUTTON}  timeout=100
    Click Element                   ${PLAYERSDOWNLOADBUTTON}
Download CSV file
    Sleep                       5s
    ${path}=                    Normalize Path    ~/Downloads
    ${RAND}=                    Evaluate            ${RANDOM_NR}
    Move file                   ${path}/tableDownload.csv    ${CURDIR}/all_players_db${RAND}.csv
    File Should Exist           ${CURDIR}/all_players_db${RAND}.csv
    Capture Page Screenshot     test_download_players_file.png

