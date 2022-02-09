import UIKit

final class PersonDetailsViewController: NiblessViewController {
    
    // MARK: - Dependencies
    
    private let viewModel: PersonDetailsViewModel

    // MARK: - init
    
    init(viewModel: PersonDetailsViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    // MARK: - View lifecycle
    
    override func loadView() {
        view = PersonDetailsRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        // Navbar color fix for XCode 13
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .white
        navigationItem.standardAppearance = barAppearance
        navigationItem.scrollEdgeAppearance = barAppearance
    }
}
