//
//  ContactViewController.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 07.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ContactViewController: UIViewController,  UICollectionViewDelegateFlowLayout {
    
    let cellHeight: CGFloat = 80
    var viewModel: ContactViewModel!
    
    let disposeBag = DisposeBag()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    convenience init(viewModel: ContactViewModel) {
        self.init()
        
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupNavigationBarTitle()
        
        collectionView.register(ContactCell.self, forCellWithReuseIdentifier: ContactCell.Identifier)
        
        viewModel.contacts
            .bindTo(collectionView.rx.items(cellIdentifier: ContactCell.Identifier, cellType:ContactCell.self)) { row, contact, cell in
                cell.contact = contact
            }
            .addDisposableTo(disposeBag)
        
        collectionView.rx.modelSelected(Contact.self)
            .bindTo(viewModel.modelSelected).addDisposableTo(disposeBag)
        
        viewModel.modelSelected
            .subscribe(onNext: { [weak self] clickedContact in
                guard let `self` = self else { return }
                
                self.contactSelected(contact: clickedContact )
            })
            .addDisposableTo(disposeBag)
        
        collectionView.rx.setDelegate(self).addDisposableTo(disposeBag)
        
        setupConstraints()
    }
    
    func setupNavigationBarTitle() {
        title = NSLocalizedString("menu_title_contact", comment: "")
    }
    
    func contactSelected(contact: Contact) {
        switch contact.type {
        case "phone_number":
            if UIApplication.shared.canOpenURL(URL(string: "tel://\(contact.value)")!){
                UIApplication.shared.openURL(URL(string: "tel://\(contact.value)")!)
            }
        case "sms":
            if UIApplication.shared.canOpenURL(URL(string: "sms://\(contact.value)")!){
                UIApplication.shared.openURL(URL(string: "sms://\(contact.value)")!)
            }
        case "email":
            if UIApplication.shared.canOpenURL(URL(string: "mailto://\(contact.value)")!){
                UIApplication.shared.openURL(URL(string: "mailto://\(contact.value)")!)
            }
        case "web_page":
            if UIApplication.shared.canOpenURL(URL(string: "\(contact.value)")!){
                UIApplication.shared.openURL(URL(string: "\(contact.value)")!)
            }
        case "linkedin":
            if UIApplication.shared.canOpenURL(URL(string: "linkedin://profile/\(contact.value)")!){
                UIApplication.shared.openURL(URL(string: "linkedin://profile/\(contact.value)")!)
            }
        default:
            break
        }
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = UIColor.white
        view.addSubview(collectionView)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
    }

    func setupConstraints() {
        collectionView.snp.makeConstraints { (make) -> Void in
            make.left.top.right.bottom.equalToSuperview()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: collectionView.frame.width, height: 0)
    }
}
