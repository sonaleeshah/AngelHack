//
//  HomeViewController.swift
//  HR
//
//  Created by Sonalee Shah on 2016-06-11.
//  Copyright © 2016 Alexathon. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet var menuButton: UIBarButtonItem!
    
    var homePageViewController: HomePageViewController? {
        didSet {
            homePageViewController?.homeDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if revealViewController() != nil {
//            revealViewController().rearViewRevealWidth = 62
            menuButton.target = revealViewController()
            menuButton.action = "revealToggle:"
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        pageControl.addTarget(self, action: "didChangePageControlValue", forControlEvents: .ValueChanged)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let homePageViewController = segue.destinationViewController as? HomePageViewController {
            self.homePageViewController = homePageViewController
        }
    }
    
    func didChangePageControlValue() {
        homePageViewController?.scrollToViewController(index: pageControl.currentPage)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension HomeViewController: HomePageViewControllerDelegate {
    
    func homePageViewController(homePageViewController: HomePageViewController,
                                    didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func homePageViewController(homePageViewController: HomePageViewController,
                                    didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
}
