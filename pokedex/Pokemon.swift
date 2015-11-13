//
//  Pokemon.swift
//  pokedex
//
//  Created by Mike Pitre on 11/6/15.
//  Copyright © 2015 Mike Pitre. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon
{
    private var _name: String!
    private var _pokedexId: Int!
    private var _desc: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _pokemonURL: String!
    
    var name: String
        {
        return _name
        }
    
    var  pokedexId: Int
        {
        return _pokedexId
        }
    
    init(name:String, pokedexId: Int)
        {
        self._name = name
        self._pokedexId = pokedexId
            
        _pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
        }
    
    func downloadPokemonDetails(completed: DownloadComplete)
        {
        
        }
    
}
