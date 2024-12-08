//
//  HomeViewController.swift
//  Swiggy_Assignment
//
//  Created by Sphoorti Patil on 06/12/24.
//

import UIKit

class HomeViewController: UIViewController {
    private var foodData: [String] = []
    private let topRatedRestaurants: [String] = Constants.topRatedFoodImageList
    private let backgroundColorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .swiggyOrange
        view.layer.masksToBounds = true
        return view
    }()
    private let customHeaderView = CustomHeaderView()
    private let searchBar = SearchBar()
    private let homeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let iconImage = UIImage(named: "HomeImage")
        imageView.image = iconImage
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TransparentTableViewCell.self, forCellReuseIdentifier: "TransparentTableViewCell")
        tableView.register(BannerTableViewCell.self, forCellReuseIdentifier: "BannerTableViewCell")
        tableView.register(TabWidgetsTableViewCell.self, forCellReuseIdentifier: "TabWidgetsCell")
        tableView.register(FoodListTableViewCell.self, forCellReuseIdentifier: "FoodListTableViewCell")
        tableView.register(TopRestaurantsTableViewCell.self, forCellReuseIdentifier: "TopRestaurantsCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.sectionHeaderTopPadding = 0
        tableView.separatorStyle = .none
        return tableView
    }()
    private let refreshControl = UIRefreshControl()
    private var alphaValue = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        cofigureNavigationBarAppearance()
        configureHeaderView()
        configureBackgroundColorView()
        configureSearchBar()
        configureHomeImageView()
        configureTableView()
        setUpTableViewDelegates()
        setRefreshControl()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        backgroundColorView.roundBottomCorners(radius: 25)
        if let customHeaderViewFrame = customHeaderView.superview?.convert(customHeaderView.frame, to: view) {
            let bottomOfCustomHeader = customHeaderViewFrame.origin.y + customHeaderViewFrame.size.height + 15
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: bottomOfCustomHeader).isActive = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureHeaderView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        customHeaderView.removeFromSuperview()
    }
    
    private func cofigureNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = nil
        appearance.backgroundColor = .swiggyOrange
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = UIColor.white
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func configureHeaderView() {
        guard let navigationBar = navigationController?.navigationBar else {
            return
        }
        customHeaderView.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.addSubview(customHeaderView)
        
        customHeaderView.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: -5)
            .isActive = true
        customHeaderView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        customHeaderView.leadingAnchor.constraint(
            equalTo: navigationBar.leadingAnchor
        ).isActive = true
        customHeaderView.trailingAnchor.constraint(
            equalTo: navigationBar.trailingAnchor).isActive = true
    }
    
    private func configureBackgroundColorView() {
        view.addSubview(backgroundColorView)
        
        backgroundColorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backgroundColorView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        backgroundColorView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        backgroundColorView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func configureSearchBar() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        backgroundColorView.addSubview(searchBar)
        
        searchBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: backgroundColorView.leadingAnchor, constant: 10).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: backgroundColorView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func configureHomeImageView() {
        backgroundColorView.addSubview(homeImageView)
        homeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        homeImageView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10).isActive = true
        homeImageView.leadingAnchor.constraint(equalTo: backgroundColorView.leadingAnchor).isActive = true
        homeImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        homeImageView.trailingAnchor.constraint(equalTo: backgroundColorView.trailingAnchor).isActive = true
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.backgroundColor = .clear
        
        view.bringSubviewToFront(homeImageView)
    }
    
    private func setUpTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setRefreshControl() {
        refreshControl.addTarget(self, action: #selector(reloadData), for: UIControl.Event.valueChanged)
        tableView.refreshControl = refreshControl
        tableView.addSubview(refreshControl)
    }
    
    @objc func reloadData(sender: UIRefreshControl) {
        sender.beginRefreshing()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            sender.endRefreshing()
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        alphaValue = max(1 - (offsetY / 210), 0)
        homeImageView.alpha = alphaValue
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 4 {
            navigationController?.pushViewController(FoodDetailsViewController(), animated: true)
        }
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        if section != 4 {
            return .zero
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 4 {
            return topRatedRestaurants.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransparentTableViewCell", for: indexPath) as? TransparentTableViewCell else { return UITableViewCell(frame: .zero) }
                cell.backgroundColor = .clear
                cell.selectionStyle = .none
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell") as? BannerTableViewCell else { return UITableViewCell(frame: .zero) }
                cell.selectionStyle = .none
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "TabWidgetsCell") as! TabWidgetsTableViewCell
                cell.selectionStyle = .none
                cell.delegate = self
                return cell
            case 3:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "FoodListTableViewCell") as? FoodListTableViewCell else { return UITableViewCell(frame: .zero) }
                cell.delegate = self
                cell.setData(_imageList: foodData)
                cell.selectionStyle = .none
                return cell
            case 4:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopRestaurantsCell") as? TopRestaurantsTableViewCell else { return UITableViewCell(frame: .zero) }
                cell.setImage(topRatedRestaurants[indexPath.row])
                cell.selectionStyle = .none
                return cell
            default:
                return UITableViewCell(frame: .zero)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 4 else { return nil }
        let headerView = UIView()
        headerView.backgroundColor = .white
        
        let topRestaurantsLabel: UILabel = {
            let label = UILabel(frame: .zero)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            label.textColor = .black
            label.textAlignment = .left
            label.text = Constants.topResturantsLabel
            label.numberOfLines = 1
            return label
        }()
        
        headerView.addSubview(topRestaurantsLabel)
        topRestaurantsLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10).isActive = true
        topRestaurantsLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10).isActive = true
        topRestaurantsLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10).isActive = true
        topRestaurantsLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        
        return headerView
    }
}

extension HomeViewController: FoodListTableViewCellDelegate {
    func didTapFoodImage(image: String) {
        navigationController?.pushViewController(FoodDetailsViewController(), animated: true)
    }
}

extension HomeViewController: TabWidgetsTableViewCellDelegate {
    func didSelectTabWidgetOption(index: Int) {
        switch index {
            case 0:
                foodData = Constants.reorderFoodImageList
            case 1:
                foodData = Constants.favouriteFoodImageList
            case 2:
                foodData = Constants.topRatedFoodImageList
            default:
                foodData = []
        }
        let indexPath = IndexPath(row: 0, section: 3)
        
        if indexPath.section < tableView.numberOfSections {
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}
