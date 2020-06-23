//
//  MyCell.swift
//  ScaleTransformTest
//
//  Created by elrond140 on 6/22/20.
//  Copyright © 2020 Testing. All rights reserved.
//

import UIKit
import CollectionViewPagingLayout

class MyCell: UICollectionViewCell, ScaleTransformView {
    
    let cellView = UIView()
    let myLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        
        cellView.backgroundColor = .white
        cellView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(cellView)
    
        myLabel.backgroundColor = .clear
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.text = "1"
        myLabel.textAlignment = .left
        myLabel.textColor = .black
        myLabel.numberOfLines = 1
        
        cellView.addSubview(myLabel)
        
    }
    
    func setupConstraints(){
        
        cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 47).isActive = true
        cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -47).isActive = true
        cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true


        myLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 0).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 0).isActive = true
        myLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: 0).isActive = true
        myLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    

    func transform(progress: CGFloat) {
        applyScaleTransform(progress: progress)
        
        // customize views here
        myLabel.alpha = 1 - abs(progress)
    }
    
    let scaleOptions = ScaleTransformViewOptions(
        
        minScale: 0.6,
        scaleRatio: 0.8,
        translationRatio: CGPoint(x: 0.66, y: 0.2),
        maxTranslationRatio: CGPoint(x: 2, y: 0),
        keepVerticalSpacingEqual: true,
        keepHorizontalSpacingEqual: true,
        scaleCurve: .linear,
        translationCurve: .linear,
        shadowEnabled: false
        
    )
}



