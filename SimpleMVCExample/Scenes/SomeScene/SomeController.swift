//
//  SomeController.swift
//  SimpleMVCExample
//
//  Created by Yuriy Kudrovsky on 30.08.2022.
//

import UIKit

// MARK: - Constants

private enum Constans {
    static let viewTitleValue = "Simple MVC Example"
    static let buttonTitleValue = "Update Model"
}

// MARK: - Implementation

final class SomeController: UIViewController {
    
    // MARK: - Private properties
    
    private var model: SomeModel? {
        willSet {
            updateView()
        }
    }
    
    // MARK: - UI properties
    
    private lazy var _view: SomeView = {
        let view = SomeView(frame: view.frame)
        view.configureWith(title: Constans.viewTitleValue,
                           buttonTitle: Constans.buttonTitleValue,
                           delegate: self)
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = _view
    }

}

// MARK: - ViewDelegate

extension SomeController: SomeViewDelegate {
    
    func didSelectButton() {
        updateModel()
    }
    
}

// MARK: - UI managment

private extension SomeController {
    
    func updateView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self._view.valueView.text = self.model?.value
        }
    }
    
}

// MARK: - State managment

private extension SomeController {
    
    func updateModel() {
        SomeService.shared.fetchSomeData {
            model = $0
        }
    }
    
}

