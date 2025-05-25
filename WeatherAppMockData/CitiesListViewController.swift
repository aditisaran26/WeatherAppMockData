//
//  CitiesListViewController.swift
//  WeatherAppMockData
//
//  Created by Aditi Ojha on 20/05/25.
//

import UIKit
// Delegate Pattern: For communication between cell and view controller
protocol CityTableViewCellDelegate: AnyObject {
    func didTapFavouriteButton(at index: Int)
}

class CitiesListViewController: UIViewController {
    
    @IBOutlet weak var cityListTableView: UITableView!
    
    // create an instance of view model
    private let viewModel = CitiesListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        cityListTableView.dataSource = self
        cityListTableView.delegate = self
        cityListTableView.register(UINib(nibName: CityTableViewCell.cellID, bundle: nil), forCellReuseIdentifier: CityTableViewCell.cellID)
    }
}

extension CitiesListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCities()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.cellID, for: indexPath) as? CityTableViewCell else { return UITableViewCell() }
        let cityName = viewModel.cityName(at: indexPath.row)
        let isFavourite = viewModel.isCityFavourite(at: indexPath.row)
        if let weather = viewModel.fetchWeatherDetails(for: indexPath.row) {
            cell.configure(
                citiName: cityName,
                temperature: weather.temperature,
                condition: weather.condition,
                time: weather.time,
                isFavourite: isFavourite,
                index: indexPath.row
            )
            cell.delegate = self
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension CitiesListViewController: CityTableViewCellDelegate {
    func didTapFavouriteButton(at index: Int) {
        viewModel.toggleFavourite(at: index)
        let indexPath = IndexPath(row: index, section: 0)
        cityListTableView.reloadRows(at: [indexPath], with: .none)
    }
    
    
}
