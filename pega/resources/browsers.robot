*** Settings ***
Variables                   ../config/__init__.py
Library                     Selenium2Library


*** Variables ***
${browser}                  ${SETTINGS['browser']}
${driver_path}              ${SETTINGS['driver_path']}


*** Keywords ***

Open HeadlessChrome

        ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
        ${chrome_options.set_binary}=  Set Variable  set_binary=${driver_path}
#        Call Method    ${chrome_options}    add_argument    headless
        Call Method    ${chrome_options}    add_argument    disable-gpu
        Call Method    ${chrome_options}    add_argument    window-size\=1024,768
        Call Method    ${chrome_options}   add_argument    no-sandbox
        Call Method    ${chrome_options}   add_argument    ignore-certificate-errors
        Call Method    ${chrome_options}   add_argument    disable-infobars
        Call Method    ${chrome_options}   add_argument    test-type
        Call Method    ${chrome_options}   add_argument    disable-extensions

#        ${prefs}=  create dictionary  geolocation=true
#        Call Method    ${chrome_options}   add_experimental_option    prefs  ${prefs}

        Create WebDriver  Chrome  chrome_options=${chrome_options}  #desired_capabilities=${preferences}



Open HeadlessPhantomJS

        ${service args}=    Create List  --ignore-ssl-errors=true
        Create Webdriver    PhantomJS    service_args=${service args}
        Set Window Size     1024    768


Open BrowserCompatibility

        run keyword if      '${browser}'=='phantom'   Open HeadlessPhantomJS
        run keyword if      '${browser}'=='chrome'    Open HeadlessChrome







