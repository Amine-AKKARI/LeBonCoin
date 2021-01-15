//
//  AdCell.swift
//  LeBonCoin
//
//  Created by Amine on 1/15/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import UIKit

class AdCell: UITableViewCell {
    
    /// padding
    private let padding: CGFloat = 5
    
    /// ad imageView
    private let adImageView: UIImageView = {
        let image = UIImageView ()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    /// ad category label
    private let adCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// ad title label
    private let adTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// ad price label
    private let adPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// ad status label
    private let adStatusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

   /// ad creation date label
    private let adCreationDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// add subviews
    private func setupSubviews() {
        self.contentView.addSubviews(adImageView, adCategoryLabel, adTitleLabel, adPriceLabel, adStatusLabel, adCreationDateLabel)
    }
    /// setup constraints
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            adImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            adImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            adImageView.widthAnchor.constraint(equalToConstant: contentView.frame.width/3),
            adImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            adCategoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            adCategoryLabel.leadingAnchor.constraint(equalTo: adImageView.trailingAnchor, constant: padding),
            adCategoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
        ])
        
        NSLayoutConstraint.activate([
            adTitleLabel.topAnchor.constraint(equalTo: adCategoryLabel.bottomAnchor, constant: padding),
            adTitleLabel.leadingAnchor.constraint(equalTo: adImageView.trailingAnchor, constant: padding),
            adTitleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -padding),
        ])
        
        NSLayoutConstraint.activate([
            adPriceLabel.topAnchor.constraint(equalTo: adTitleLabel.bottomAnchor, constant: padding),
            adPriceLabel.leadingAnchor.constraint(equalTo: adImageView.trailingAnchor, constant: padding),
            adPriceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -padding),
        ])
        
        NSLayoutConstraint.activate([
            adStatusLabel.topAnchor.constraint(equalTo: adPriceLabel.bottomAnchor, constant: padding),
            adStatusLabel.leadingAnchor.constraint(equalTo: adImageView.trailingAnchor, constant: padding),
            adStatusLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -padding),
        ])
        
        NSLayoutConstraint.activate([
            adCreationDateLabel.topAnchor.constraint(equalTo: adStatusLabel.bottomAnchor, constant: padding),
            adCreationDateLabel.leadingAnchor.constraint(equalTo: adImageView.trailingAnchor, constant: padding),
            adCreationDateLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -padding),
        ])
    }
    
    func configureCell() {
        adImageView.backgroundColor = .red
        adCategoryLabel.text = "category"
        adTitleLabel.text = "title"
        adPriceLabel.text = "label"
        adStatusLabel.text = "state"
        adCreationDateLabel.text = "date"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
