# list here the .qml sources files that can be translated
SOURCES += main.qml \
    FamousPlacesDialog.qml \
    MultimediaDialog.qml

# list here the language .ts files
TRANSLATIONS += \
    main_en.ts{% for locale in cookiecutter.plugin_locales.split(',') %} main_{{ locale.strip() }}.ts{% endfor %}
