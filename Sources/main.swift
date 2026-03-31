import Cocoa

@main
struct HelloWorldApp: App {
    var body: some Scene {
        Window("Hello World", id: "main") {
            ContentView()
        }
        .defaultSize(width: 400, height: 300)
    }
}
