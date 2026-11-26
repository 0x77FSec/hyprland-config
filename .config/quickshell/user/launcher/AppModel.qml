import Quickshell

ScriptModel {
    id: appModel

    property string searchText: ""

    values: {
        const query = searchText.trim().toLowerCase()

        return DesktopEntries.applications.values
            .filter(entry => {
                const name = entry.name.toLowerCase()
                const generic = (entry.genericName || "").toLowerCase()
                const comment = (entry.comment || "").toLowerCase()

                return name.includes(query) ||
                       generic.includes(query) ||
                       comment.includes(query)
            })
            .sort((a, b) => a.name.localeCompare(b.name))
    }
}