//
//  TableViewCell.swift
//  TableView
//
//  Created by Said Tura Saidazimov on 14.02.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    var videoImage = UIImageView()
    var videoLabel = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(videoLabel)
        addSubview(videoImage)
        configureLabel()
        configureVideoImage()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - Element design
    func configureVideoImage() {
        videoImage.layer.cornerRadius = 10
        videoImage.clipsToBounds = true
        videoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            videoImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            videoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            videoImage.heightAnchor.constraint(equalToConstant: 80),
            videoImage.widthAnchor.constraint(equalTo: videoImage.heightAnchor )
            ])
    }
    
    func set(video: Video) {
        videoImage.image    = video.image
        videoLabel.text     = video.title
    }
    
    func configureLabel() {
        videoLabel.numberOfLines = 0
        videoLabel.adjustsFontSizeToFitWidth = true
        videoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            videoLabel.heightAnchor.constraint(equalToConstant: 80),
            videoLabel.leadingAnchor.constraint(equalTo: videoImage.trailingAnchor, constant: 20),
            videoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            videoLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }
}
