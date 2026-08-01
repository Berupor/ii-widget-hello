import qs.modules.widgets
import qs.services

/** Hello world for the extensions fork: the smallest widget that is still a real one. */
WidgetManifest {
    widgetId: "hello"
    name: Translation.tr("Hello")
    description: Translation.tr("Template widget: copy this repo to start your own")
    icon: "waving_hand"
    version: "1.3"
    author: "Berupor"
    minShellVersion: "1.2" // Orientations on a bar slot, so not below 1.2
    dependencies: ["uptime"] // Greyed out in the catalog until they are all there
    slots: ({
        // Drop an orientation and the widget stays out of that bar; a bare path means horizontal
        "barIndicator": { "path": "HelloIndicator.qml", "orientations": ["horizontal", "vertical"] }
    })
    options: [
        {
            "key": "showGreeting",
            "type": "switch",
            "icon": "waving_hand",
            "label": Translation.tr("Greet from the bar, not just the popup"),
            "default": true
        },
        {
            "key": "pollSeconds",
            "type": "spinBox",
            "icon": "timer",
            "label": Translation.tr("Ask the system every, s"),
            "min": 5,
            "max": 600,
            "step": 5,
            "default": 60
        }
    ]
}
