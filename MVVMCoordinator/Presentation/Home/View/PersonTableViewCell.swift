import UIKit

final class PersonTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "PersonTableViewCell"
    private var hierarchyNotReady = true
    
    // MARK: - Outlets
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Methods
    
    func setContent(person: Person) {
        fullNameLabel.text = person.name
    }
}

extension PersonTableViewCell: RootViewAbility {

    override func didMoveToWindow() {
        super.didMoveToWindow()
        guard hierarchyNotReady else { return }
        configureView()
        hierarchyNotReady = false
    }

    func constructHierarchy() {
        contentView.addSubview(fullNameLabel)
    }

    func activateConstraints() {
        NSLayoutConstraint.activate([
            fullNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            fullNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            fullNameLabel.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor, constant: -12),
        ])
    }
}
