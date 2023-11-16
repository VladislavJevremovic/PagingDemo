import SwiftUI

@main
struct PagingDemoApp: App {
    @StateObject var pagingViewModel = PagingViewModel(service: DummyNetworkService())

    var body: some Scene {
        WindowGroup {
            PagingView(viewModel: pagingViewModel) { item in
                DummyProductView(product: item)
            }
        }
    }
}
