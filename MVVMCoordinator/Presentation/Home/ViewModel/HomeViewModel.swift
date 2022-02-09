import Foundation
import RxCocoa
import RxSwift

struct HomeViewModelActions {
    let routeToDetails: ( _ person: Person) -> Void
}

protocol HomeViewModelInput {
    func viewDidLoad()
    func didSelect(person: Person)
}

protocol HomeViewModelOutput {
    var people: BehaviorRelay<[Person]> { get }
    var isLoading: PublishRelay<Bool> { get }
    var errorMessage: PublishRelay<String> { get }
}

protocol HomeViewModel: HomeViewModelInput, HomeViewModelOutput {}

final class DefaultHomeViewModel: HomeViewModel {
   
    // MARK: - Dependencies
    
    private let actions: HomeViewModelActions
    private let useCase: ForbesListUseCase
    
    // MARK: - OUTPUT
    
    let people: BehaviorRelay<[Person]> = BehaviorRelay<[Person]>(value: [])
    let isLoading: PublishRelay<Bool> = PublishRelay<Bool>()
    let errorMessage: PublishRelay<String> = PublishRelay<String>()
    
    // MARK: - Init
    
    init(actions: HomeViewModelActions,
         forbesListUseCase: ForbesListUseCase) {
        self.actions = actions
        self.useCase = forbesListUseCase
    }
    
    private func getData() {
        isLoading.accept(true)
        
        useCase.getForbesList { [weak self] result in
            guard let self = self else { return }
            self.isLoading.accept(false)
            switch result {
            case .success(let people):
                self.people.accept(people)
            case .failure(let error):
                self.errorMessage.accept(error.localizedDescription)
            }
        }
    }
}

// MARK: - INPUT

extension DefaultHomeViewModel {
    
    func viewDidLoad() {
        getData()
    }
    
    func didSelect(person: Person) {
        actions.routeToDetails(person)
    }
}
