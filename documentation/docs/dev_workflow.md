---
icon: lucide/chevrons-left-right-ellipsis
---

# Development workflow

Now that a QField plugin has been generated using the templater, we are ready to develop it further !

## Load the plugin in QField

- [x] Download a version of a QField build, pick a recent version [from the recent releases](https://github.com/opengisch/qfield/releases).

- [x] Open this QField build, go to [the Plugins Manager](https://docs.qfield.org/how-to/advanced-how-tos/plugins/#application-plugins) and install the `QField plugin reloader`:

![Installing the QField plugin reloader in QField](./images/qfield-install-reloader-plugin.webp)

- [x] Create a symbolic link from the generated plugin directory into the QField plugins directory:

```sh
ln -s /path/to/the/generated/directory/my-topologizer \
    "~/Documents/QField Documents/QField/plugins
```
