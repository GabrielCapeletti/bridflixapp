//
//  MovieTableCell.swift
//  bridflix
//
//  Created by Gabriel on 17/03/17.
//  Copyright © 2017 bridge. All rights reserved.
//

import Foundation
import UIKit

class MovieTableCell : UITableViewCell , ValuedField{

    var titleLabel : UILabel = UILabel()
    var descriptionLabel : UILabel = UILabel()
    
    var verticalStack:UIStackView?
    
    var value: MovieItem?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        verticalStack = UIStackView(frame:self.frame)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        verticalStack!.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel = UILabel(frame : CGRect(x: 0, y: 0, width: frame.width - 10, height: 20))
        titleLabel.font = UIFont(name: "Arial", size: 12)
        titleLabel.numberOfLines = 0
        
        descriptionLabel = UILabel(frame : CGRect(x: 0, y: 20, width: frame.width - 10, height: 20))
        descriptionLabel.font = UIFont(name: "Arial", size: 8)
        descriptionLabel.numberOfLines = 4

        verticalStack?.addSubview(titleLabel)
        verticalStack?.addSubview(descriptionLabel)
        addSubview(verticalStack!)
    }
    
    func setFieldValue(value: MovieItem) {
        self.value = value
        descriptionLabel.text = self.value?.description
        titleLabel.text = self.value?.name
    }
    
    func getFieldValue() -> MovieItem {
        return value!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}
