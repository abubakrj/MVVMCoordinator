import UIKit
import RxSwift

final class HomeRootView: NiblessView {

    // MARK: - Dependencies

    private let viewModel: HomeViewModel
    
    // MARK: - Properties

    private let bag = DisposeBag()
    private var hierarchyNotReady = true
    
    // MARK: - Init
    
    init(frame: CGRect = .zero, viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
    }

    // MARK:  - Outlets

    private let tableView: UITableView = {
        let tv = UITableView()
        tv.register(PersonTableViewCell.self, forCellReuseIdentifier: PersonTableViewCell.identifier)
        tv.rowHeight = 36
        tv.tableFooterView = UIView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
}

extension HomeRootView: RootViewAbility {

    override func didMoveToWindow() {
        super.didMoveToWindow()
        guard hierarchyNotReady else { return }
        configureView()
        hierarchyNotReady = false
    }

    func constructHierarchy() {
        addSubview(tableView)
    }

    func activateConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupBindings() {
        
        viewModel
            .people
            .bind(to: tableView.rx.items(cellIdentifier: PersonTableViewCell.identifier, cellType: PersonTableViewCell.self)) { _, person, cell in
                cell.setContent(person: person)
            }
            .disposed(by: bag)
        
        tableView
            .rx
            .modelSelected(Person.self)
            .subscribe(onNext: { [weak self] person in
                self?.viewModel.didSelect(person: person)
            })
            .disposed(by: bag)
    
        tableView
            .rx
            .itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.tableView.deselectRow(at: indexPath, animated: true)
            })
            .disposed(by: bag)
    }
}
