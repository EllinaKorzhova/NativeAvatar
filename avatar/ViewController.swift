//
//  ViewController.swift
//  avatar
//
//  Created by Эллина Коржова on 23.03.23.
//

import UIKit

class ViewController: UIViewController {
    var scrollView = UIScrollView()
    let rightImage = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addedAvatarOnBar()
        rightImage.tintColor = .systemIndigo
        
       
        scrollView.contentSize = view.frame.size
        scrollView.frame = view.bounds
        view.addSubview(scrollView)
        
    }
    
    private func addedAvatarOnBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Avatar"
        
        DispatchQueue.main.async {
            guard let UINavigationLargeTitleView = NSClassFromString("_UINavigationBarLargeTitleView") else {
                return
            }
            
            
            self.navigationController?.navigationBar.subviews.forEach { subview in
                if subview.isKind(of: UINavigationLargeTitleView.self) {
                    let viewAvatar = self.rightImage
                    viewAvatar.clipsToBounds = true
                    subview.addSubview(viewAvatar)
                    viewAvatar.translatesAutoresizingMaskIntoConstraints = false
                    
                    NSLayoutConstraint.activate([
                        viewAvatar.rightAnchor.constraint(equalTo: subview.rightAnchor,
                                                          constant: -15),
                        viewAvatar.bottomAnchor.constraint(equalTo: subview.bottomAnchor,
                                                           constant: -15),
                        viewAvatar.heightAnchor.constraint(equalToConstant: 36),
                        viewAvatar.widthAnchor.constraint(equalTo: viewAvatar.heightAnchor)
                    ])
                    
                }
            }
            
        }
    }
}
