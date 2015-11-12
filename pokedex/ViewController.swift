//
//  ViewController.swift
//  pokedex
//
//  Created by Mike Pitre on 11/6/15.
//  Copyright © 2015 Mike Pitre. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{

    override func viewDidLoad()
        {
        super.viewDidLoad()
        }

    override func didReceiveMemoryWarning()
        {
        super.didReceiveMemoryWarning()
        }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
        {
            if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell
                {
                return cell
                }
            else
                {
                return PokeCell()
                }
        }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
        {
        <#code#>
        }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
        {
        return 30
        }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
        {
        return 1
        }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
        {
        CGSizeMake(105, 105)
        }


}

