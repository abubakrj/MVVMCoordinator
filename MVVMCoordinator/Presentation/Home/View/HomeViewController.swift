import UIKit
import RxSwift

final class HomeViewController: NiblessViewController {
    
    // MARK: - Dependencies
    
    private let viewModel: HomeViewModel

    // MARK: - Init
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    // MARK: - View lifecycle
    
    override func loadView() {
        view = HomeRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        viewModel.viewDidLoad()
    }

    private func configureNavigationBar() {
        self.title = "Home"
        
        // Navbar color fix for XCode 13
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .white
        navigationItem.standardAppearance = barAppearance
        navigationItem.scrollEdgeAppearance = barAppearance
    }
}
