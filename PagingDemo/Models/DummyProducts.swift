struct DummyProducts: Codable {
    let products: [DummyProduct]
    let total: Int
    let skip: Int
    let limit: Int
}
