//
//  HomeTableViewCell.swift
//  MarvelTask
//
//  Created by Systems on 27/02/2024.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Main Function
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configCell(data: HomeModel) {
        cellLabel.text = data.title
        ImageLoaderHelper.loadImage(imageUrl: data.url , imageView: cellImage, placeholder: UIImage(named: "logoPlaceHolder"))
    }

}
