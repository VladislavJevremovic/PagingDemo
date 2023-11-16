import Foundation

class DummyNetworkService: PagingService {
    typealias DataModel = DummyProduct

    func fetchPage(_ page: Int) async throws -> [DataModel] {
        let pageSize = 10
        let urlString = "https://dummyjson.com/products?limit=\(pageSize)&skip=\(page * pageSize)&select=title,price"

        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(DummyProducts.self, from: data)

        return result.products
    }
}
