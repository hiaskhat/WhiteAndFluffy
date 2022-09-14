//
//  FavoriteViewController.swift
//  WhiteAndFluffy
//
//  Created by Асхат Баймуканов on 04.09.2022.
//

import UIKit

class FavoriteViewController: UIViewController {

    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    
    var example = ["1", "2", "3", "4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "Favorite"
        
        tableView.dataSource = self
        tableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: FavoriteTableViewCell.identifier)
        safeArea = view.layoutMarginsGuide
        setupTableView()
    }
    
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: "cell")
      }



}

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return example.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.identifier, for: indexPath) as? FavoriteTableViewCell {
            cell.textLabel?.text = example[indexPath.row]
            cell.configureCell(image: "image-1")
            return cell
        }
        fatalError("Couldn't reuse cell")
    }
    
    
}
