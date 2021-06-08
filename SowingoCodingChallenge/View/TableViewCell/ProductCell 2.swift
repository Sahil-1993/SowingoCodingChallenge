//
//  ProductCell.swift
//  SowingoCodingChallenge
//
//  Created by Sahil Arora on 2021-05-14.
//

import UIKit

class ProductCell: UITableViewCell {

@IBOutlet weak var imageViewProduct: UIImageView!
@IBOutlet weak var viewProductCell:UIView!
@IBOutlet  weak var bestSellerBadge:UIImageView!
@IBOutlet  weak var productDescription:UILabel!
@IBOutlet  weak var manufacturerName:UILabel!
@IBOutlet  weak var listPrice:UILabel!
@IBOutlet  weak var yourPrice:UILabel!
@IBOutlet  weak var buttonFavourite: UIButton!

var delegate: FavouriteProduct?

override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
}

override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
}

func configureCell(model: ProductViewModel){
    viewProductCell.layer.borderColor = ColorCode.filterViewBorderColor.cgColor
    viewProductCell.layer.borderWidth = 1.0
    
    //Setting Data on cell
    listPrice.attributedText = listPrice.strikeThroughText(text: "$\(model.listPrice)")
    yourPrice.text = "$\(model.yourPrice)"
    manufacturerName.text  = model.manufacturerName
    productDescription.text  = model.description
    
    buttonFavourite.isSelected = model.isFavoriteProduct
    buttonFavourite.setImage(model.isFavoriteProduct ? Images.favouriteImage! : Images.defaultFavouriteImage!, for: .normal)
    bestSellerBadge.isHidden = model.badgeImageUrl != "" ? false : true
    
    guard model.mainImageUrl != nil else{
        imageViewProduct.contentMode = .center
        imageViewProduct.image = Images.placeholderImage!;
        return
    }
    imageViewProduct.downloadImage(url: model.mainImageUrl!) { (success, Image) in
        if success{
            self.imageViewProduct.image = Image
        } else {
            self.imageViewProduct.image = Images.placeholderImage
        }
    }
}

@IBAction func didTapFavourite(_ sender: UIButton) {
    if ReachabilityManager.sharedInstance.isConnected{
        if sender.isSelected {
            buttonFavourite.setImage(Images.defaultFavouriteImage!, for: .normal)
        } else {
            buttonFavourite.setImage(Images.favouriteImage!, for: .normal)
        }
        delegate?.getIndexPath(cell: self)
        } else {
        print(AlertMessages.InternetConnectionMessage)
        }
}
}


