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
    
    @IBOutlet weak var collection: UICollectionView!

    override func viewDidLoad()
        {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        }

    override func didReceiveMemoryWarning()
        {
        super.didReceiveMemoryWarning()
        }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
        {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell
            {
            let pokemon = Pokemon(name: "Test", pokedexId: indexPath.row + 1)
            cell.configureCell(pokemon)
            return cell
            }
        else
            {
            return UICollectionViewCell()
            }
        }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
        {
            
        }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
        {
        return 718
        }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
        {
        return 1
        }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
        {
        return CGSizeMake(105, 105)
        }


}

