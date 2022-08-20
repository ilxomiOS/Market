//
//  SneakersListViewController.swift
//  Online Market 4
//
//  Created by Ilxom on 18/08/22.
//

import UIKit

class SneakersListViewController: UIViewController {
    
    let sneakersList = UITableView()
    var arrayOfSneakers = Sneakers.getSneakersData()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        sneakersList.translatesAutoresizingMaskIntoConstraints = false
        sneakersList.dataSource = self
        sneakersList.delegate = self
        sneakersList.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(sneakersList)
        title = "Sneakers List"
        
        NSLayoutConstraint.activate([
            sneakersList.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            sneakersList.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            sneakersList.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            sneakersList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}

extension SneakersListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfSneakers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let sneakers = arrayOfSneakers[indexPath.row]
        cell.textLabel?.text = sneakers.sneakers
        cell.imageView?.image = UIImage(named: sneakers.model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = DetailsViewController()
            detailVC.sneakers = arrayOfSneakers[indexPath.row]
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
}
