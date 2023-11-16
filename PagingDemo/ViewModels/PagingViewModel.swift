import SwiftUI

@MainActor
class PagingViewModel<DataModel, Service: PagingService>: ObservableObject where Service.DataModel == DataModel {
    @Published var items: [DataModel] = []
    @Published var isLoading = false

    private var currentPage = 1
    private var hasMorePages = true
    private var service: Service

    init(service: Service) {
        self.service = service
        
        Task { await fetchNextPage() }
    }

    func fetchNextPage() async {
        guard hasMorePages && !isLoading else { return }
        isLoading = true

        do {
            let newItems = try await service.fetchPage(currentPage)
            currentPage += 1
            items.append(contentsOf: newItems)
            hasMorePages = !newItems.isEmpty
        } catch {
            print(error)
        }

        isLoading = false
    }
}
