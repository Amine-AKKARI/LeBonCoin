//
//  AdDetailsViewController.swift
//  LeBonCoin
//
//  Created by Amine on 1/15/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import UIKit

class AdDetailsViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    var adViewModel:AdViewModel!
    private let padding: CGFloat = 20
    
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView ()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor.white
        return scrollView
    }()
    
    private let hostingView : UIView = {
        let hostingView = UIView ()
        hostingView.translatesAutoresizingMaskIntoConstraints = false
        return hostingView
    }()
    
    private let adImageView: UIImageView = {
        let image = UIImageView ()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let adCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let adTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let adDescriptionLabel: UILabel = {
           let label = UILabel()
           label.numberOfLines = 0
           label.font = UIFont.systemFont(ofSize: 16, weight: .light)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    
    private let adPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let adStatusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let adCreationDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints ()
        configureView(viewModel: adViewModel)
    }
    
    override func viewDidLayoutSubviews ()
    {
        var contentHeight:CGFloat = 0.0
        for i in 0 ..< hostingView.subviews.count {
            let view = hostingView.subviews[i]
            contentHeight += view.frame.size.height
        }
        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: contentHeight + 150)
    }
    /// Ad subviews
    func setupSubviews() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(hostingView)
        hostingView.addSubviews(adImageView,
                               adCategoryLabel,
                               adTitleLabel,
                               adDescriptionLabel,
                               adPriceLabel,
                               adStatusLabel,
                               adCreationDateLabel)
    }
    
    /// Setup Constraints
    func setupConstraints () {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
        ])
        
        NSLayoutConstraint.activate([
            hostingView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostingView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostingView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            hostingView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
        
       // scrollView.contentSize = hostingView.frame.size
    
        NSLayoutConstraint.activate([
            adImageView.topAnchor.constraint(equalTo: hostingView.topAnchor, constant: padding),
            adImageView.centerXAnchor.constraint(equalTo: hostingView.centerXAnchor),
            adImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            adImageView.heightAnchor.constraint(equalToConstant: 200),
        ])

        NSLayoutConstraint.activate([
            adCategoryLabel.topAnchor.constraint(equalTo: adImageView.bottomAnchor, constant: padding),
            adCategoryLabel.leadingAnchor.constraint(equalTo: hostingView.leadingAnchor, constant: padding),
            adCategoryLabel.trailingAnchor.constraint(equalTo: hostingView.trailingAnchor, constant: -padding)
        ])

        NSLayoutConstraint.activate([
            adTitleLabel.topAnchor.constraint(equalTo: adCategoryLabel.bottomAnchor, constant: padding),
            adTitleLabel.leadingAnchor.constraint(equalTo: hostingView.leadingAnchor, constant: padding),
            adTitleLabel.trailingAnchor.constraint(equalTo: hostingView.trailingAnchor, constant: -padding)
        ])
        NSLayoutConstraint.activate([
            adDescriptionLabel.topAnchor.constraint(equalTo: adTitleLabel.bottomAnchor, constant: padding),
            adDescriptionLabel.leadingAnchor.constraint(equalTo: hostingView.leadingAnchor, constant: padding),
            adDescriptionLabel.trailingAnchor.constraint(equalTo: hostingView.trailingAnchor, constant: -padding)
        ])
        NSLayoutConstraint.activate([
            adPriceLabel.topAnchor.constraint(equalTo: adDescriptionLabel.bottomAnchor, constant: padding),
            adPriceLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding),
            adPriceLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -padding)
        ])
        NSLayoutConstraint.activate([
            adStatusLabel.topAnchor.constraint(equalTo: adPriceLabel.bottomAnchor, constant: padding),
            adStatusLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding),
            adStatusLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -padding)
        ])
        NSLayoutConstraint.activate([
            adCreationDateLabel.topAnchor.constraint(equalTo: adStatusLabel.bottomAnchor, constant: padding),
            adCreationDateLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding),
            adCreationDateLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -padding)
        ])
    }

    /**
     Configure View with viewModel
     - Parameter viewModel: ViewModel.
     */
    func configureView(viewModel: AdViewModel) {
        adImageView.loadImageUsingCacheWithURLString(viewModel.thumbImageURl, placeHolder: UIImage(named: "placeholder"))
        adCategoryLabel.text = viewModel.categoryName
        adTitleLabel.text = viewModel.title
        adDescriptionLabel.text = viewModel.description
        adPriceLabel.text = viewModel.price
        adStatusLabel.text = viewModel.state
        adCreationDateLabel.text = viewModel.creationDate
    }
}
