import UIKit
import RxSwift

final class PersonDetailsRootView: NiblessView {

    // MARK: - Dependencies

    private let viewModel: PersonDetailsViewModel
    
    // MARK: - Properties

    private let bag = DisposeBag()
    private var hierarchyNotReady = true
    
    // MARK: - Init
    
    init(frame: CGRect = .zero, viewModel: PersonDetailsViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
    }

    // MARK:  - Outlets

    private let fullNameLabel: UILabel = makeLabelToShowDetails(fontSize: 20)
    
    private static func makeLabelToShowDetails(fontSize: CGFloat = 15) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        return label
    }
}

extension PersonDetailsRootView: RootViewAbility {

    override func didMoveToWindow() {
        super.didMoveToWindow()
        guard hierarchyNotReady else { return }
        configureView()
        hierarchyNotReady = false
    }
    
    func configureAppearance() {
        backgroundColor = .white
    }
    
    func constructHierarchy() {
        addSubview(fullNameLabel)
    }

    func activateConstraints() {
        NSLayoutConstraint.activate([
            fullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            fullNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setupBindings() {        
        viewModel.name.bind(to: fullNameLabel.rx.text).disposed(by: bag)
    }
}
