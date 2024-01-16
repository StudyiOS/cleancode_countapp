//
//  FoodTapCell.swift
//  CountApp
//
//  Created by 황홍필 on 2024/01/13.
//

import UIKit

final class FoodTapCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension FoodTapCell: ViewDrawable {
    func configureUI() {
        setBackgroundColor()
        setAutolayout()
    }
    
    func setBackgroundColor() {
        self.backgroundColor = .countBackground
    }
    
    func setAutolayout() {
        
    }
}
