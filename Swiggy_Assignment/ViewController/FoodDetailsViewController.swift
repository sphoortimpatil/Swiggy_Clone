//
//  FoodDetailsViewController.swift
//  Swiggy_Assignment
//
//  Created by Sphoorti Patil on 07/12/24.
//

import UIKit

class FoodDetailsViewController: UIViewController {
    private let foodDetailsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FoodImageTableViewCell.self, forCellReuseIdentifier: "FoodImageCell")
        tableView.register(FoodDescriptionTableViewCell.self, forCellReuseIdentifier: "FoodDescriptionCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureFoodDetailsTableView()
        setDelegates()
    }
    
    private func configureFoodDetailsTableView() {
        view.addSubview(foodDetailsTableView)
        
        foodDetailsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        foodDetailsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        foodDetailsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        foodDetailsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func setDelegates() {
        foodDetailsTableView.delegate = self
        foodDetailsTableView.dataSource = self
    }
}

extension FoodDetailsViewController: UITableViewDelegate { }

extension FoodDetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "FoodImageCell", for: indexPath) as? FoodImageTableViewCell else { return UITableViewCell(frame: .zero) }
                cell.selectionStyle = .none
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "FoodDescriptionCell", for: indexPath) as? FoodDescriptionTableViewCell else { return UITableViewCell(frame: .zero) }
                cell.selectionStyle = .none
                return cell
            default:
                return UITableViewCell(frame: .zero)
        }
    }
}
