//
//  DetailCell.swift
//  ConcurrencyLab
//
//  Created by Tsering Lama on 12/6/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var capitalText: UILabel!
    @IBOutlet weak var populationText: UILabel!
    @IBOutlet weak var countryView: UIImageView!
    
    func loadCell(country: Country) {
        
        nameText.text = country.name
        capitalText.text = country.capital
        populationText.text = country.population.description
        
        FlagClient.getImage(countryUrl: "https://www.countryflags.io/\(country.alpha2Code)/flat/64.png") { [unowned self] (result) in
            switch result {
            case .failure(let error):
                print("\(error)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.countryView.image = image
                }
            }
        }
    }
}
