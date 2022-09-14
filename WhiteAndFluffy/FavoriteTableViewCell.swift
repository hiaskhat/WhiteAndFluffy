//
//  FavoriteTableViewCell.swift
//  WhiteAndFluffy
//
//  Created by Асхат Баймуканов on 10.09.2022.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    static let identifier = "FavoriteTableViewCell"

    var unsplashModel: UnsplashModel? {
        didSet {
            photoImage.image = UIImage(url: URL(string: unsplashModel!.imageURL))
            photoDescriptionLabel.text = unsplashModel?.photoDescription
        }
    }
    
    lazy var photoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let photoDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(photoImage)
        addSubview(photoDescriptionLabel)
//        photoImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        photoImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        photoImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        photoImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        photoImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        photoDescriptionLabel.anchor(top: topAnchor, left: photoImage.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 5, paddingRight: 5, width: 0, height: 70, enableInsets: false)
        
    }
    
    func configureCell (image: String) {
        photoImage.image = UIImage(named: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }
            
    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}
