//
//  FoodsView.swift
//  CountApp
//
//  Created by 황홍필 on 2024/01/15.
//

import UIKit
import SnapKit

final class FoodView: UIView {
    
    // MARK: - UI Components
    let foodName: UILabel = {
        let label = UILabel()
        label.font = .LINESeedBold(size: 16)
        return label
    }()
    
    let foodTapCount: UILabel = {
        let label = UILabel()
        label.font = .LINESeedBold(size: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension FoodView: ViewDrawable {
    func configureUI() {
        setBackgroundColor()
        setAutolayout()
    }
    
    func setBackgroundColor() {
        self.backgroundColor = .countBackground
    }
    
    func setAutolayout() {
        [foodName, foodTapCount].forEach { self.addSubview($0) }
        
        foodName.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(20)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        foodTapCount.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-20)
            make.centerY.equalTo(self.snp.centerY)
        }
    }
}
