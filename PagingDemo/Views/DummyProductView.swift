import SwiftUI

struct DummyProductView: View {
    let product: DummyProduct

    var body: some View {
        VStack(alignment: .leading) {
            Text(product.title)
                .font(.headline)
                .fontWeight(.bold)
            Text("$\(product.price)")
                .font(.body)
        }
    }
}
