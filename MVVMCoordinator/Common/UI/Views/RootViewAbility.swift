import Foundation

protocol RootViewAbility: AnyObject {
    
    func configureView()
    
    func configureAppearance()
    
    func constructHierarchy()
    
    func activateConstraints()
    
    func wireActions()
    
    func setupBindings()
    
}

extension RootViewAbility {
    
    func configureView() {
        configureAppearance()
        constructHierarchy()
        activateConstraints()
        wireActions()
        setupBindings()
    }
    
    func configureAppearance() {}
    
    func setupBindings() {}
    
    func wireActions() {}
}
