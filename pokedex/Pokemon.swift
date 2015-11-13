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
    private var _pokemonUrl: String!
    
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
            
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
        }
    
    func downloadPokemonDetails(completed: DownloadComplete)
        {
        let url = NSURL(string: _pokemonUrl)!
        Alamofire.request(.GET, url).responseJSON
            {
            response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject>
                {
                if let defense = dict["defense"] as? Int
                    {
                    self._defense = "\(defense)"
                    }
                if let height = dict["height"] as? String
                    {
                    self._height = height
                    }
                if let weight = dict["weight"] as? String
                    {
                    self._weight = weight
                    }
                if let attack = dict["attack"] as? Int
                    {
                    self._attack = "\(attack)"
                    }
                if let types = dict["types"] as? [Dictionary<String, String>]
                    {
                    if let type = types[0]["name"]
                        {
                        self._type = type
                        }
                    if types.count > 1
                        {
                        for var x = 1; x < types.count; x++
                            {
                            if let type = types[x]["name"]
                                {
                                self._type! += "/\(type)"
                                }
                            }
                        }
                    } else
                        {
                        self._type = ""
                        }
                    
                print(self._defense)
                print(self._height)
                print(self._weight)
                print(self._attack)
                print(self._type)
                }
            }
        }
}
