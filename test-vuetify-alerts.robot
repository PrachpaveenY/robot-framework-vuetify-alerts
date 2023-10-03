*** Settings ***
Library    SeleniumLibrary
# Library    Database
# Library    Database Teardown
# Library    Database Assertions



*** Variables ***
${URL}    https://v2.vuetifyjs.com/en/components/alerts/#usage
${BROWSER}    Chrome

${SPACE}    Set Variable    ${EMPTY}

${ELEMENT_BUTTON_DENSE}  //*[@id="usage"]/div/div/div/div[1]/div[1]/div/div/div[2]/div/button[1]
${ELEMENT_BUTTON_PROMINENT}  //*[@id="usage"]/div/div/div/div[1]/div[1]/div/div/div[2]/div/button[2]
${ELEMENT_BUTTON_OUTLINED}  //*[@id="usage"]/div/div/div/div[1]/div[1]/div/div/div[2]/div/button[3]
${ELEMENT_BUTTON_TEXT}  //*[@id="usage"]/div/div/div/div[1]/div[1]/div/div/div[2]/div/button[4]
${ELEMENT_BUTTON_SHAPED}  //*[@id="usage"]/div/div/div/div[1]/div[1]/div/div/div[2]/div/button[5]
${ELEMENT_NEXT_RIGHT}  //*[@id="usage"]/div/div/div/div[1]/div[1]/div/div/div[3]
${ELEMENT_NEXT_LEFT}  //*[@id="usage"]/div/div/div/div[1]/div[1]/div/div/div[1]

${ELEMENT_SELECTION_DISMISSIBLE}  css:.v-input--selection-controls__ripple
${ELEMENT_BUTTON_CLOSE}  //*[@id="usage"]/div/div/div/div[1]/div[2]/div/div/button
${ELEMENT_BUTTON_RESET}  //*[@id="usage"]/div/div/div/div[1]/div[2]/button
${ELEMENT_ALERT}  //*[@id="usage"]/div/div/div/div[1]/div[2]/div

${ELEMENT_SLIDER}  //*[@id="usage"]/div/div/div/div[2]/div[2]/div/div/div[2]/div/div/div

${ELEMENT_INPUT_BORDER}  //*[@id="usage"]/div/div/div/div[2]/div[2]/div/div/div[3]
${ELEMENT_INPUT_COLOR}  //*[@id="usage"]/div/div/div/div[2]/div[2]/div/div/div[4]
${ELEMENT_INPUT_ICON}  //*[@id="usage"]/div/div/div/div[2]/div[2]/div/div/div[5]
${ELEMENT_INPUT_TYPE}  //*[@id="usage"]/div/div/div/div[2]/div[2]/div/div/div[6]



*** Keywords ***
Open Vuetifyjs
    Open Browser    ${URL}    browser=${BROWSER}
Element Should Not Be Empty
    [Arguments]  ${locator}
    ${text}  Get Text  ${locator}
    Should Not Be Equal  ${text}  ${EMPTY}

Click Element and Verify
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${is_enabled}  Element Should Be Enabled  ${locator}
    Click Element  ${locator}

Click Button close and Verify of the Usage section
    [Arguments]  ${locator}
    ${is_button_close} =    Run Keyword And Return Status    Wait Until Element Is Visible  ${locator} 
    Run Keyword If  ${is_button_close}  Click Element  ${locator}
    Wait Until Element Is Visible  ${ELEMENT_BUTTON_RESET}
    ${text_reset}  Get Text  ${ELEMENT_BUTTON_RESET}
    Should Be Equal  ${text_reset}  RESET
    Click Element  ${ELEMENT_BUTTON_RESET}    
    Wait Until Element Is Visible  ${ELEMENT_ALERT}    
    ${text_alert}  Get Text  ${ELEMENT_ALERT}
    Should Be Equal  ${text_alert}  I'm an Alert Usage Example

Check Element
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}  

Check Element and Text
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}   
    ${text_alert}  Get Text  ${locator}
    Element Should Not Be Empty  ${locator}
    Element Should Not Contain  ${locator}  ${SPACE}

Connect To Database

Verify Connection

Table Should Exist



*** Test Cases ***
Test Case 1: Test the Usage section of v-alert - Verify
    Open Vuetifyjs
    Click Element and Verify  ${ELEMENT_SELECTION_DISMISSIBLE}
    Click Button close and Verify of the Usage section  ${ELEMENT_BUTTON_CLOSE}
    # [Teardown]  Close Browser

Test Case 2: Test v-slide-group and v-button of group
    Check Element and Text    ${ELEMENT_BUTTON_DENSE}
    Check Element and Text    ${ELEMENT_BUTTON_PROMINENT}
    Check Element and Text    ${ELEMENT_BUTTON_OUTLINED}
    Check Element and Text    ${ELEMENT_BUTTON_TEXT}
    Check Element and Text    ${ELEMENT_BUTTON_SHAPED}

Test Case 3: Test usage selection-controls
    Click Element and Verify  ${ELEMENT_SELECTION_DISMISSIBLE}
    # [Teardown]  Close Browser

Test Case 4: Test v-slider of Elevation
    Check Element  ${ELEMENT_SLIDER}

Test Case 5: Test v-select of Border
    Check Element  ${ELEMENT_INPUT_BORDER}

Test Case 6: Test v-select of Color
    Check Element  ${ELEMENT_INPUT_COLOR}

Test Case 7: Test v-select of Icon
    Check Element  ${ELEMENT_INPUT_ICON}

Test Case 8: Test v-select of Type
    Check Element  ${ELEMENT_INPUT_TYPE}

# Test Case Database 1: Test Connection and Table of Database - MySQL



*** Comments ***
Test Case 1: Test the Usage section of v-alert - Verify
    Open Vuetifyjs.
    Test all functionality of the Usage section.
    Check all Element of the Usage section.

Test Case 2: Test v-slide-group and v-button of group
    Check all Element and Text within v-slide-group.

Test Case 3: Test usage selection-controls
    use selection-controls.
    check enabled of selection-controls.

Test Case 4: Test v-slider of Elevation
    Check Element v-slider of Elevation.

Test Case 5: Test v-select of Border
    Check Element v-select of Border.

Test Case 6: Test v-select of Color
    Check Element v-select of Color.

Test Case 7: Test v-select of Icon
    Check Element v-select of Icon.

Test Case 8: Test v-select of Type
    Check Element v-select of Type.

Test Case Database 1: Test Connection and Table of Database - MySQL
    Check Connection and Table of MySQL.