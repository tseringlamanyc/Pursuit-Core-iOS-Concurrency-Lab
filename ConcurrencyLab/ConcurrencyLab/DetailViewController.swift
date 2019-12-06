//
//  DetailViewController.swift
//  ConcurrencyLab
//
//  Created by Tsering Lama on 12/5/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var capitalText: UILabel!
    @IBOutlet weak var populationText: UILabel!
    
    var country: Country!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        FlagClient.getImage(countryUrl: "https://www.countryflags.io/\(country.alpha2Code)/flat/64.png") { [unowned self] (result) in
        switch result {
        case .failure(let error):
            print("\(error)")
        case .success(let image):
            DispatchQueue.main.async {
                self.flagImage.image = image
            }
        }
    }

        nameText.text = country.name
        capitalText.text = country.capital
        populationText.text = country.population.description

}
}
