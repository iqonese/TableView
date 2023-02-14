//
//  TableViewVC.swift
//  TableView
//
//  Created by Said Tura Saidazimov on 13.02.2023.
//
import Foundation
import UIKit

class TableViewVC: UIViewController {
    var tableView = UITableView()
    var videos: [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videos = fetchData()
        configureTableView()
        delegatesTableVeiw()
        view.backgroundColor = .white
        title = "Let's go"
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 100
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "VideoCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
        ])
    }
    
    func delegatesTableVeiw() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}
//MARK: - TableViewCell installation and registration
extension TableViewVC: UITableViewDelegate, UITableViewDataSource {
    // hey, how many rows am I gonna return? function
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    // hey, what cells am I showing? function
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! TableViewCell
        cell.set(video: videos[indexPath.row])
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .gray
        }
        cell.layer.cornerRadius = 8
        return cell
    }
    
    func fetchData() -> [Video] {
        return {[
            Video(image: Images.aapl,   title: "Apple"),
            Video(image: Images.amzn,   title: "Amazon"),
            Video(image: Images.bac,    title: "Central Bank"),
            Video(image: Images.google, title: "Google"),
            Video(image: Images.ma,     title: "MasterCard"),
            Video(image: Images.msft,   title: "Microsoft"),
            Video(image: Images.tesla,  title: "Tesla"),
            Video(image: Images.yandex, title: "Yandex")
        ]}()
    }
}
