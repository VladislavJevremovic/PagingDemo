import SwiftUI

struct PagingView<DataModel, Service: PagingService, ItemView: View>: View where Service.DataModel == DataModel, DataModel: Identifiable {
    @ObservedObject var viewModel: PagingViewModel<DataModel, Service>
    let itemViewBuilder: (DataModel) -> ItemView

    init(
        viewModel: PagingViewModel<DataModel, Service>,
        @ViewBuilder itemViewBuilder: @escaping (DataModel) -> ItemView
    ) {
        self.viewModel = viewModel
        self.itemViewBuilder = itemViewBuilder
    }

    var body: some View {
        List(viewModel.items) { item in
            itemViewBuilder(item)
                .onAppear {
                    if viewModel.items.hasLastItem(item) {
                        Task { await viewModel.fetchNextPage() }
                    }
                }
        }
        .overlay(
            Group {
                if viewModel.isLoading {
                    ProgressView()
                }
            }, alignment: .bottom
        )
    }
}
