import qs.modules.widgets
import qs.services

/** Hello world for the extensions fork: the smallest widget that is still a real one. */
WidgetManifest {
    widgetId: "hello"
    name: Translation.tr("Hello")
    description: Translation.tr("Template widget: copy this repo to start your own")
    icon: "waving_hand"
    version: "1.0"
    author: "Berupor"
    minShellVersion: "1.0"
    // dependencies: ["some-cli"] // Greyed out in the catalog until they are all there
    slots: ({
        "barIndicator": "HelloIndicator.qml"
    })
    options: [
        {
            "key": "badge",
            "type": "switch",
            "icon": "counter_1",
            "label": Translation.tr("Show the badge"),
            "default": true
        }
    ]
}
