//
//  ViewController.swift
//  ScaleTransformTest
//
//  Created by elrond140 on 6/22/20.
//  Copyright © 2020 Testing. All rights reserved.
//

import UIKit
import CollectionViewPagingLayout

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var data:[String] = ["Value1", "Value2", "Value3", "Value4", "Value5", "Value6", "Value7", "Value8", "Value9", "Value10"]
    //Variables
    var blockOperation = BlockOperation()
    
    //CollectionView
    let myCellIdentifier = "myCellID"
    var myCollectionView: UICollectionView!
    let layout = CollectionViewPagingLayout()
    
    //Buttons
    let goToButton = UIButton()
    let deleteButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        
        self.setupCollectionView()
        self.setupViews()
        self.setupConstraints()
    }
    
    
    private func setupCollectionView() {
        
        layout.numberOfVisibleItems = 3
        myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        myCollectionView.isPagingEnabled = true
        myCollectionView.register(MyCell.self, forCellWithReuseIdentifier: myCellIdentifier)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.showsHorizontalScrollIndicator = false
        myCollectionView.showsVerticalScrollIndicator = false
        
        //Doesn't work with paging module    myCollectionView.semanticContentAttribute = .forceRightToLeft
        myCollectionView.backgroundColor = .clear
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.clipsToBounds = false
        
        self.view.addSubview(myCollectionView)
    }
    
    
    func setupViews(){
        
        goToButton.backgroundColor = .red
        goToButton.translatesAutoresizingMaskIntoConstraints = false
        goToButton.setTitle("Go To \"Value 5\"", for: .normal)
        goToButton.addTarget(self, action: #selector(self.goToButtonPressed), for: .touchUpInside)
        
        self.view.addSubview(goToButton)
    }
    
    
    func setupConstraints(){
        
        myCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        myCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        myCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        myCollectionView.bottomAnchor.constraint(equalTo: goToButton.topAnchor, constant: -30).isActive = true
        
        goToButton.heightAnchor.constraint(equalToConstant: 85).isActive = true
        goToButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
        goToButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        goToButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myCellIdentifier, for: indexPath) as! MyCell
        
        cell.myLabel.text = data[indexPath.row]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    @objc func goToButtonPressed(){
        print("goTo-pressed")
        layout.setCurrentPage(4, animated: false)
    }
    
}
