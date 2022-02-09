import Foundation

protocol ForbesListUseCase {
    func getForbesList(onComplete: @escaping (Result<[Person], Error>) -> Void)
}

final class DefaultForbesListUseCase {
    // Some intialization goes here
}

extension DefaultForbesListUseCase: ForbesListUseCase {
    
    func getForbesList(onComplete: @escaping (Result<[Person], Error>) -> Void) {
        let people = [Person(name: "Alex", age: 25),
                      Person(name: "Bob", age: 20),
                      Person(name: "John", age: 32),
                      Person(name: "Alisa", age: 28),
                      Person(name: "Mario", age: 25)]
        onComplete(.success(people))
    }
}
