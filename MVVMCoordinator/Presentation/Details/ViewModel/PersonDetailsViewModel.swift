import Foundation
import RxSwift

final class PersonDetailsViewModel {
    
    // MARK: - Properties
    
    let name: BehaviorSubject<String>
    
    // MARK: - Init
    
    init(with person: Person) {
        name = BehaviorSubject(value: person.name)
    }
}
