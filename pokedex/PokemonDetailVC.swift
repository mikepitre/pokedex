//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Mike Pitre on 11/12/15.
//  Copyright © 2015 Mike Pitre. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!
    
    //outlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    

    override func viewDidLoad()
        {
        super.viewDidLoad()
            
        nameLbl.text = pokemon.name.capitalizedString
        mainImg.image = UIImage(named: "\(pokemon.pokedexId)")
            
        pokemon.downloadPokemonDetails
            { () -> () in
            //this will be called when download is done
            self.updateUI()
            }
        }
    
    func updateUI()
        {
        descLbl.text = pokemon.desc
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        pokedexLbl.text = pokemon.pokedexId
        weightLbl.text = pokemon.weight
        baseAttackLbl.text = pokemon.attack
        currentEvoImg.image = mainImg.image
        nextEvoImg.image = UIImage(named: "\(pokemon.nextEvolutionId)")
        if pokemon.nextEvolutionLvl == ""
            {
            evoLbl.text = "\(pokemon.name.capitalizedString) is the Final Evolution"
            nextEvoImg.hidden = true
            }
        else
            {
            evoLbl.text = "Next Evolution: \(pokemon.nextEvolutionTxt) @ LVL \(pokemon.nextEvolutionLvl)"
            }
        }

    override func didReceiveMemoryWarning()
        {
        super.didReceiveMemoryWarning()
        }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
}
