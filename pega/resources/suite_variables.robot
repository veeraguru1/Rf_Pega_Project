*** Keywords ***
Set suite variables
    log to console          ${CURDIR}
    set suite variable      ${RESOURCES}    ${CURDIR}           children=true
    set suite variable      ${CONFIG_PATH}  ${CURDIR}/../config/__init__.py  children=true