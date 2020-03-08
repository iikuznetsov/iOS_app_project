//
//  MainPageCollectionViewCell.swift
//  iOS_app_project
//
//  Created by Мария Караваева on 08.03.2020.
//  Copyright © 2020 Игорь Кузнецов. All rights reserved.
//

import UIKit

class MainPageCollectionViewCell: UICollectionViewCell {
    static let reuseID = String(describing: MainPageCollectionViewCell.self)
    static let nib = UINib(nibName: String(describing: MainPageCollectionViewCell.self), bundle: nil)
    

    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 4
        Label.font = UIFont.systemFont(ofSize: 18)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateContentStyle()
    }
    
    func update(title: String, image: UIImage) {
        imageView.image = image
        Label.text = title
    }
    
    private func updateContentStyle() {
        let isHorizontalStyle = bounds.width > 2 * bounds.height
        let oldAxis = stackView.axis
        let newAxis: NSLayoutConstraint.Axis = isHorizontalStyle ? .horizontal : .vertical
        guard oldAxis != newAxis else { return }

        stackView.axis = newAxis
        stackView.spacing = isHorizontalStyle ? 16 : 4
        Label.textAlignment = isHorizontalStyle ? .left : .center
        let fontTransform: CGAffineTransform = isHorizontalStyle ? .identity : CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.3) {
            self.Label.transform = fontTransform
            self.layoutIfNeeded()
        }
    }
}


