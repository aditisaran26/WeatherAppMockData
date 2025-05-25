//
//  CityTableViewCell.swift
//  WeatherAppMockData
//
//  Created by Aditi Ojha on 20/05/25.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    static let cellID: String = "CityTableViewCell"
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityTemperature: UILabel!
    @IBOutlet weak var cityCondition: UILabel!
    @IBOutlet weak var cityTime: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!

    weak var delegate: CityTableViewCellDelegate?
    private var index: Int?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(citiName: String, temperature: Int, condition: String, time: String, isFavourite: Bool, index: Int ) {
        self.index = index
        cityName.text = citiName
        cityTemperature.text = "\(temperature)°C"
        cityCondition.text = condition
        cityTime.text = time
        let imageName = isFavourite ? "favouriteButtonSelected" : "favouriteButtonUnselected"
        favouriteButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @IBAction func favouriteButtonTapped(_ sender: UIButton) {
        if let index = index {
            delegate?.didTapFavouriteButton(at: index)
        }
    }


}



