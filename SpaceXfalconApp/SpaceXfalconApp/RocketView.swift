//
//  CustomView.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 18.04.23.
//

import UIKit
import SnapKit

protocol RocketViewDelegate {
    func didTapButton()
}
class RocketView: UIView {
    
    var delegate: RocketViewDelegate?
    let scrollView = UIScrollView()
    let button = UIButton()
    
    init() {
        super.init(frame: .zero)
        setupScrollView()
        setupButton()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupScrollView() {
        addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupButton() {
        addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.snp.makeConstraints{ maker in
            maker.center.equalToSuperview()
            maker.width.equalTo(250)
            maker.height.equalTo(320)
        }
    }
    @objc func didTapButton() {
        
        delegate?.didTapButton()
    }
}
