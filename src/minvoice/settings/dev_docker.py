from minvoice.settings.dev import *  # NOQA (ignore all errors on this line)

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'minvoice_dev',
        'USER': 'minvoice',
        'PASSWORD': 'password',
        'HOST': 'postgres',
        'PORT': 5432,
    }
}
