import UIKit

final class AppFlowCoordinator {
    
    // MARK: - Dependencies
    
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    // MARK: - References
    
    private weak var homeVIewController: HomeViewController?
    private weak var detailsviewController: PersonDetailsViewController?
    
    // MARK: - Init
    
    init(navigationController: UINavigationController,
         appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        let actions = HomeViewModelActions(routeToDetails: routeToDetailsScreen(_:))
        let viewController = appDIContainer.makeHomeViewController(actions: actions)
        navigationController.pushViewController(viewController, animated: false)
        
        self.homeVIewController = viewController
    }
    
    private func routeToDetailsScreen( _ person: Person) {
        let viewController = appDIContainer.makePersonDetailsViewController(with: person)
        navigationController.pushViewController(viewController, animated: true)
        
        self.detailsviewController = viewController
    }
}
