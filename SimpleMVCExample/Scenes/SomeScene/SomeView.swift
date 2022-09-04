//
//  SomeView.swift
//  SimpleMVCExample
//
//  Created by Yury Kudrovsky on 30.08.2022.
//

import UIKit

// MARK: - Constants

private enum Constans {
    static let titleLabelWidth = 200.0
    static let titleLabelHeight = 100.0
    static let titleLabelTopInsetFactor = 12.0
    
    static let valueLabelWidth = 200.0
    static let valueLabelHeight = 180.0
    static let valueLabelTopInsetFactor = 3.7
    static let valueLabelFontSize = 120.0
    
    static let buttonWidth = 200.0
    static let buttonHeight = 44.0
    static let buttonTopInsetFactor = 1.5
    static let buttonRadiusFactor = 2.0
    static let buttonBorderWidthFactor = 2.0
    
    static let centerationFactor = 2.0
}

// MARK: - Configuration

protocol SomeViewDelegate: AnyObject {
    func didSelectButton()
}

extension SomeView {
    
    func configureWith(title: String, buttonTitle: String, delegate: SomeViewDelegate?) {
        titleView.text = title
        buttonView.setTitle(buttonTitle, for: .normal)
        self.delegate = delegate
    }
    
}

// MARK: - Implementation

final class SomeView: UIView {
    
    // MARK: - Private properties
    
    private weak var delegate: SomeViewDelegate?
    
    // MARK: - UI properties
    
    lazy var titleView: UILabel = {
        let view = UILabel(frame: CGRect(x: frame.width / Constans.centerationFactor - Constans.titleLabelWidth / Constans.centerationFactor,
                                         y: frame.height / Constans.titleLabelTopInsetFactor,
                                         width: Constans.titleLabelWidth,
                                         height: Constans.titleLabelHeight))
        view.textColor = .white
        view.textAlignment = .center
        return view
    }()
    
    lazy var valueView: UILabel = {
        let view = UILabel(frame: CGRect(x: frame.width / Constans.centerationFactor - Constans.valueLabelWidth / Constans.centerationFactor,
                                         y: frame.height / Constans.valueLabelTopInsetFactor,
                                         width: Constans.valueLabelWidth,
                                         height: Constans.valueLabelHeight))
        view.font = UIFont.systemFont(ofSize: Constans.valueLabelFontSize)
        view.textColor = .white
        view.textAlignment = .center
        return view
    }()
    
    lazy var buttonView: UIButton = {
        let view = UIButton(frame: CGRect(x: frame.width / Constans.centerationFactor - Constans.buttonWidth / Constans.centerationFactor,
                                          y: frame.height / Constans.buttonTopInsetFactor,
                                          width: Constans.buttonWidth,
                                          height: Constans.buttonHeight))
        view.backgroundColor = .clear
        view.layer.cornerRadius = Constans.buttonHeight / Constans.buttonRadiusFactor
        view.layer.borderWidth = Constans.buttonBorderWidthFactor
        view.layer.borderColor = UIColor.blue.cgColor
        view.addTarget(self, action: #selector(didSelectButton), for: .touchUpInside)
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
}

// MARK: - UI managment

private extension SomeView {
    
    func setupView() {
        addSubview(titleView)
        addSubview(valueView)
        addSubview(buttonView)
    }
    
}

// MARK: - Actions

private extension SomeView {
    
    @objc func didSelectButton() {
        delegate?.didSelectButton()
    }
    
}
