# Robot Framework for Robot Spare Bin Industries
# Settings,Keywords,Variables,Test Cases are section header names
# Importing SeleniumLibrary to use web automation features
*** Settings ***
Library    SeleniumLibrary


# Variables used in test cases are defined here
*** Variables ***
# ${} represents Scalar variables. URL and BROWSER are scalar variables.
${URL}   https://robotsparebinindustries.com/
${BROWSER}   Chrome

# @{} represents List variables. 
# FIELDS values are used to locate elements on the page.
@{FIELDS}    id=username    id=password    id=logout

# &{} represents Dictionary variables. USERINFO contains login credentials.
&{USERINFO}    Username=maria  Password=thoushallnotpass


# Test Cases represent the scenarios to be executed.
# Test Cases are written in Plain English language.
*** Test Cases ***
# Reusable Keywords are used to perform login and logout operations.
Login functionality of Robot Spare Bin Industries

    # Initiate the Chrome browser and navigate to the given URL
    # Arguments[ ${URL},${BROWSER}] are used to pass values to the keyword
    Initate Browser    ${URL}    ${BROWSER}

    # Input login credentials and variables are passed as arguments
    # ${FIELDS[0]} represents accessing a specific element in the FIELDS list
    Input of Login Credentials     ${FIELDS[0]}   ${FIELDS[1]}   ${USERINFO['Username']}  ${USERINFO['Password']}
    
    # Assertion to verify successful login
    Assertion after Login

    # Logging out and Closing the browser
    Logout Functionality    ${FIELDS[2]}
    Close Browser


# Keywords are reusable functions that can be called in test cases.
# Keywords makes the test cases more readable and maintainable.
# All Keywords are used in the test cases above.
*** Keywords ***
Initate Browser

    # This keyword opens the browser and navigates to the specified URL
    # Maximizes the browser window
    [Arguments]    ${URL}    ${BROWSER}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Implicit wait is implemented with timeout of 10 seconds
    Set Selenium Timeout  10s

Input of Login Credentials
    # Locates the input fields for username and password using the FIELDS list
    # Inputs the username and password into the respective fields
    [Arguments]    ${FIELDS[0]}   ${FIELDS[1]}   ${USERINFO['Username']}  ${USERINFO['Password']}
    Input Text    ${FIELDS[0]}    ${USERINFO['Username']}
    Input Text    ${FIELDS[1]}   ${USERINFO['Password']}

    # Clicks the submit button to log in
    Click Button    xpath=//button[@type="submit"]

Assertion after Login
    
    # Log To Console is used to print messages in the console
    Log To Console    Successfully logged in!

    # Verifies that the page contains the expected text after login
    Page Should Contain    Order your robot!
    Log To Console   Page contains 'Order your robot!'

Logout Functionality

    # Explicitly waits for the logout button to be visible before clicking it
    # Clicks the logout button to log out
    [Arguments]    ${FIELDS[2]}
    Wait Until Element Is Visible    ${FIELDS[2]}    timeout=10s
    Click Button    ${FIELDS[2]} 
    Log To Console    Successfully logged out!
    

    

