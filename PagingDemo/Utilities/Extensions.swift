import Foundation

extension Array where Element: Identifiable {
    func hasLastItem(_ item: Element) -> Bool {
        last?.id == item.id
    }
}
