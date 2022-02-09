import UIKit
import CoreData

final class AppDIContainer {
    
    func makeHomeViewController(actions: HomeViewModelActions) -> HomeViewController {
        let viewModel = makeHomeViewModel(actions: actions)
        return HomeViewController(viewModel: viewModel)
    }
    
    private func makeHomeViewModel(actions: HomeViewModelActions) -> HomeViewModel {
        let forbesListUseCase: ForbesListUseCase = DefaultForbesListUseCase()
        return DefaultHomeViewModel(actions: actions, forbesListUseCase: forbesListUseCase)
    }
    
    func makePersonDetailsViewController(with person: Person) -> PersonDetailsViewController {
        let viewModel = makePersonDetailsViewModel(person: person)
        return PersonDetailsViewController(viewModel: viewModel)
    }
    
    private func makePersonDetailsViewModel(person: Person) -> PersonDetailsViewModel {
        return PersonDetailsViewModel(with: person)
    }
}
