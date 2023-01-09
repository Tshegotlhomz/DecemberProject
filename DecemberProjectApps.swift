import SwiftUI

@main
struct DecemberProjectApp: App {
    var kitsuNetworkManager = KitsuNetworkManager()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(kitsuNetworkManager)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
