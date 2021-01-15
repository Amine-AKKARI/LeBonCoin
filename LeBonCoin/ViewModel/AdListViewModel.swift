//
//  AdListViewModel.swift
//  LeBonCoin
//
//  Created by Amine on 1/15/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import Foundation

struct AdViewModel {
    var ad: Ad
    var categoryName = ""
    var title = ""
    var description = ""
    var smallImageUrl = ""
    var thumbImageURl = ""
    var price = ""
    var creationDate = ""
    var state = ""
    
    init(ad: Ad, categoryName: String) {
        self.ad = ad
        self.categoryName = categoryName
        self.title = getTitleFrom(ad)
        self.description = getDescriptionFrom(ad)
        self.smallImageUrl = getSmallImageUrlFrom(ad)
        self.thumbImageURl = getThumbImageUrlFrom(ad)
        self.price = getPriceFrom(ad)
        self.creationDate = getCreationDateFrom(ad)
        self.state = getIsUrgentTagFrom(ad)
    }
}

extension AdViewModel {
    private func getTitleFrom (_ ad: Ad) -> String {
        return ad.title
    }
    private func getDescriptionFrom (_ ad: Ad) -> String {
        return ad.description
    }
    private func getSmallImageUrlFrom (_ ad: Ad) -> String {
        guard let small = ad.imagesUrl?.small  else { return "" }
        return small
    }
    private func getThumbImageUrlFrom (_ ad: Ad) -> String {
        guard let thumb = ad.imagesUrl?.thumb  else { return "" }
        return thumb
    }
    private func getPriceFrom (_ ad: Ad) -> String {
        if ad.price.truncatingRemainder(dividingBy: 1) == 0 {
            return "\(Int(ad.price)) €"
        }
        return "\(ad.price) €"
    }
    private func getCreationDateFrom (_ ad: Ad) -> String {
        return ad.creationDate.convertDateToFormat(endformat:"dd/MM/yyyy HH:mm:ss" , initialFormat: "yyyy-MM-dd'T'HH:mm:ss+0000")
    }
    private func getIsUrgentTagFrom (_ ad: Ad) -> String {
        let state = (ad.isUrgent) ? "Urgent" : "Non urgent"
        return state
    }
}


class AdListViewModel {
   
    let adClient: AdClient
    var categories: [AdCategory] = [] {
        didSet {
            getAds()
        }
    }
    var sortedAdsViewModel : [AdViewModel] = []
    var copyAdViewModel = [AdViewModel]()
    var adsViewModel : [AdViewModel] = [] {
        didSet {
            reloadList()
        }
    }
    var reloadList = {() -> () in }
    /**
     AdListViewModel Constructor
     - Parameter viewModel: ViewModel.
     */
    init(adClient: AdClient) {
        self.adClient = adClient
    }
}

extension AdListViewModel {
    
    func configureAdListViewModel () {
        getCategories()
    }
    
    /// Get categories from API
    func getCategories () {
        adClient.getCategories(from: .categories) { result  in
            switch result {
            case .success(let categories):
                if let categories = categories {
                    self.categories = categories
                }
            case .failure(let error):
                print("the error \(error)")
            }
        }
    }
    
    /// Get Ads from API
    func getAds () {
        adClient.getAds(from: .ads) { result in
            switch result {
            case .success(let ads):
                if let ads = ads {
                    let sortedAds = self.sortAds(adsArray: ads)
                    var tempViewModel = [AdViewModel]()
                    for ad in sortedAds {
                        let categoryName = self.searchForCategoryName(categories: self.categories, categoryId : ad.categoryId)
                        tempViewModel.append(AdViewModel(ad: ad, categoryName: categoryName))
                    }
                    self.adsViewModel = tempViewModel
                    self.copyAdViewModel = self.adsViewModel
                }
                
            case .failure(let error):
                print("the error \(error)")
            }
        }
    }
    
    /**
    Get Category name from categories array depend on category ID
    - Parameter categories: Array of categories
    - Parameter categoryId: category ID
    - Returns: CategoryName: String
    */
    func searchForCategoryName(categories: [AdCategory], categoryId: Int) -> String {
        let filteredCategories = categories.filter { category in
          return category.categoryId == categoryId
        }
        guard filteredCategories.count > 0 else {return ""}
        return filteredCategories[0].categoryName
    }
    
    /**
     Sort ads Array
     - Parameter adsArray: Array of ads
     - Returns: Sorted array of ads
    
     */
    func sortAds (adsArray: [Ad]) -> [Ad] {
        var sortByAscendingDate = adsArray.sorted(by: { $0.creationDate.getDateFromString (format: "yyyy-MM-dd'T'HH:mm:ss+0000").compare($1.creationDate.getDateFromString(format: "yyyy-MM-dd'T'HH:mm:ss+0000")) == .orderedDescending })
        let urgentAds = sortByAscendingDate.filter {ad in
            return ad.isUrgent == true
        }
        sortByAscendingDate = sortByAscendingDate.filter { !urgentAds.contains($0) }
        let finalSortedArray = urgentAds + sortByAscendingDate
        return finalSortedArray
    }
}

