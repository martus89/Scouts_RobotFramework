*** Settings ***
Library         SeleniumLibrary
Documentation   Suite description
Resource        ../resources.robot
Test Setup      Run Keywords    Login to the system EN
Test Teardown   Run Keywords    Log Out And Close The Browser

*** Variables ***
${ACTIVITYLASTCREATEDMATCH}     xpath=//a[3]/button
${FORMSUBMITBUTTON}             xpath=//button[@type='submit']/span

*** Test Cases ***
Open last created match
    Open last created match
    Sleep                           3s
    Assert element text

*** Keywords ***
Open last created match
    Wait Until Element Is Visible   ${ACTIVITYLASTCREATEDMATCH}     timeout=30
    Click Element                   ${ACTIVITYLASTCREATEDMATCH}
Assert element text
    Wait Until Element Is Visible   ${FORMSUBMITBUTTON}     timeout=30
    Get Text                        ${FORMSUBMITBUTTON}
    Element Text Should Be          ${FORMSUBMITBUTTON}     SUBMIT
    Capture Page Screenshot         alert_open_last_created_match.png


