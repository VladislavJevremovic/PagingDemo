protocol PagingService {
    associatedtype DataModel

    func fetchPage(_ page: Int) async throws -> [DataModel]
}
