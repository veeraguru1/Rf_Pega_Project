from defaults import SETTINGS

CURRENT_ENV = 'STG'

ENVS = {
    'STG': {

        'browser': 'chrome',
    }
}

SETTINGS['pega_url'] = 'https://sainsbury-2.pegacloud.com/prweb/beEBp4uRVTogorRwSwWqbOtn9IL2fwdI*/!STANDARD?'
SETTINGS['pega_uid'] = 'csruser'
SETTINGS['pega_pwd'] = 'oscar'

# ST Env
# SETTINGS['pega_url'] = 'https://sainsbury-2.pegacloud.com/prweb/beEBp4uRVTogorRwSwWqbOtn9IL2fwdI*/!STANDARD?'
# Dev Env
# SETTINGS['pega_url'] = 'https://sainsbury-1.pegacloud.com/prweb/2YHfFBq1DT6kZ7eZtWghBA%5B%5B*/!STANDARD?'
# SETTINGS['pega_uid'] = 'csrinstore'
# # SETTINGS['pega_uid'] = 'R10user'
# SETTINGS['pega_pwd'] = 'oscar'


# SETTINGS['store_url'] = 'https://sainsbury-2.pegacloud.com/prweb/beEBp4uRVTogorRwSwWqbOtn9IL2fwdI*/!STANDARD?'
# SETTINGS['store_uid'] = 'csrinstore'
# SETTINGS['store_pwd'] = 'oscar'

SETTINGS['driver_path'] = '/usr/local/bin/chromedriver'
# SETTINGS['browser'] = 'chrome'



SETTINGS['browser'] = ENVS[CURRENT_ENV]['browser']